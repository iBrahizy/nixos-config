{ ... }:

{
	# Imports everything in this directory apart from itself (default.nix)
	imports = let 
		concatDir = (s: "${./.}/${s}");
		isNotDefault = (s: s != "default.nix");
		filesInDir = (builtins.attrNames (builtins.readDir ./.));
	in
		builtins.map concatDir (builtins.filter isNotDefault filesInDir);
}
