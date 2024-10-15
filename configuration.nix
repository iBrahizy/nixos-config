{ inputs, pkgs, ... }:

{
	# needed for nixd to see available packages and other options
	nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
	# !!!!
	programs.nano.enable = false;

	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Newer kernel
	boot.kernelPackages = pkgs.linuxPackages_latest;

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/London";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_GB.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_GB.UTF-8";
		LC_IDENTIFICATION = "en_GB.UTF-8";
		LC_MEASUREMENT = "en_GB.UTF-8";
		LC_MONETARY = "en_GB.UTF-8";
		LC_NAME = "en_GB.UTF-8";
		LC_NUMERIC = "en_GB.UTF-8";
		LC_PAPER = "en_GB.UTF-8";
		LC_TELEPHONE = "en_GB.UTF-8";
		LC_TIME = "en_GB.UTF-8";
	};

	environment.defaultPackages = with pkgs; [
		# nvim treesitter needs gcc
		gcc
		gnumake
		yazi
		ripgrep
		git
		lsd
		zoxide
		fd
		starship
		curl
		tldr
		fastfetch
		nixd
	];
	# Configure console keymap
	console.keyMap = "uk";
}
