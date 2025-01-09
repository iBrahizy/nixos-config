{ flakeRoot, pkgs, config, ... }:

let
	helix-patched = (pkgs.callPackage ./${flakeRoot}/packages/helix-bin-patch {});
in
{
	home-manager.users.${config.user} = {
		programs.helix= {
			enable = true;
			defaultEditor = true;

			package = helix-patched;
		};

		home.file.".config/helix".source = ./.;
		# home.file.".config/helix".source = config.home-manager.users.${config.user}.lib.file.mkOutOfStoreSymlink ./.;
	};
}
