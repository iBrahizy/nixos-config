#!/usr/bin/env nix-shell
#!nix-shell -i bash -p unzip curl jq common-updater-scripts

set -eo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

bin_file="$(realpath ./package.nix)"

new_version="$(curl -s "https://api.github.com/repos/ppy/osu/releases?per_page=1" | jq -r '.[0].name')"
old_version="$(sed -nE 's/\s*version = "(.*)".*/\1/p' ./package.nix)"
if [[ "$new_version" == "$old_version" ]]; then
    echo "Already up to date."
    exit 0
fi

# cd ../../../..

echo "Updating osu-lazer-bin from $old_version to $new_version..."
sed -Ei.bak '/ *version = "/s/".+"/"'"$new_version"'"/' "$bin_file"
rm "$bin_file.bak"

file='x86_64-linux osu.AppImage'
set -- $file

echo "Prefetching binary for $1..."
prefetch_output=$(nix --extra-experimental-features nix-command store prefetch-file --json --hash-type sha256 "https://github.com/ppy/osu/releases/download/$new_version/$2")
hash=$(jq -r '.hash' <<<"$prefetch_output")

echo "$1 ($2): hash = $hash"
sed -Ei.bak 's@("sha256-)[^;"]+@"'"$hash"'@' "$bin_file"
# sed -Ei.bak 's@( *sha256 = "sha256-)[^"]+@\1'"$hash"'@' "$bin_file"
rm "$bin_file.bak"
