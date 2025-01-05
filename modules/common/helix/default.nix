{ lib, pkgs, config, ... }:

{
	
	home-manager.users.${config.user} = {
		programs.helix= {
			enable = true;
			defaultEditor = true;

			package = (pkgs.helix.overrideAttrs (oldAttrs: rec {
				version = "25.01";

				src = pkgs.fetchzip {
					url = "https://github.com/helix-editor/helix/releases/download/${version}/helix-${version}-source.tar.xz";
					hash = "sha256-HyDsHimDug+8vX0wfon4pK0DEYH5402CDinp3EZpaWs=";
					stripRoot = false;
				};

				cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
				    # name = "${name}-vendor";
				    inherit src;
				    outputHash = "sha256-siOrpSgvvdVINAgVFpU77gFHtPes0N1lngQYDYhRWgU=";
				});
			}));
		};

		home.file.".config/helix".source = ./.;
		# home.file.".config/helix".source = config.home-manager.users.${config.user}.lib.file.mkOutOfStoreSymlink ./.;
	};
}
