{ ... }:

{
	# Imports everything in this directory apart from itself (default.nix)
	imports = let 
		concatDir = (s: "${./.}/${s}");
		isNotDefault = (s: s != "default.nix");
		isNotMangoHudConf = (s: s != "mangohud.conf");
		predicate = (s: isNotDefault s && isNotMangoHudConf s);
		filesInDir = (builtins.attrNames (builtins.readDir ./.));
	in
		map concatDir (builtins.filter predicate filesInDir);
}
