starship init fish | source
zoxide init fish | source

set lastd $HOME/.lastd
touch $lastd
source $lastd

set -g fish_key_bindings fish_vi_key_bindings
set -U fish_greeting

bind -M insert \v accept-autosuggestion

function cd_on_start --on-event fish_prompt
	echo "builtin cd '$(pwd)'" > $lastd 
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function once
	nix shell nixpkgs#$argv[1] -c $argv
end
