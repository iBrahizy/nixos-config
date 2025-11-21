{ pkgs, modules, ... }:

{
	imports = [
		./hardware-configuration.nix
		/${modules}/desktop
		/${modules}/gaming
		/${modules}/dev
		/${modules}/uni
	];
	powerManagement.enable = true;

	
	boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux.override {
		argsOverride = rec {
			src = pkgs.fetchurl {
				url = "https://www.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
				sha256 = "sha256-YrEuzTB1o1frMgk1ZX3oTgFVKANxfa04P6fMOqSqKQU=";
			};
			version = "6.14.8";
			modDirVersion = "6.14.8";
		};
	});

	system.stateVersion = "24.05";
	home-manager.users.ibrahizy.home.stateVersion = "24.05";
}
