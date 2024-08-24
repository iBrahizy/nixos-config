{ inputs, pkgs, ... }:

{
	imports =
	[ 
	];

	# needed for nixd to see available packages and other options
	nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

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

	fonts.packages = with pkgs; [
		(nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
	];

	environment.defaultPackages = with pkgs; [
		chromium # I would love to not have chromium but i need it for wootingly
		pulseaudio
		vlc
		obs-studio
		lumafly
		ani-cli
		ripgrep
		breeze-gtk
		breeze-qt5
		breeze-icons
		protontricks
		ksnip
		(haskellPackages.ghcWithPackages (haskellPackages: [
			haskellPackages.xmobar
			haskellPackages.xmonad
			haskellPackages.xmonad-contrib
		]))
		haskellPackages.haskell-language-server
		catppuccin-sddm
		gcc
		python3
		rustup
		git
		gnumake
		xclip
		firefox
		alacritty
		lsd
		zoxide
		fd
		nnn
		starship
		curl
		tldr
		fastfetch
		rtkit
		nixd
		python312Packages.python-lsp-server
	];

	# Configure keymap in X11
	services.xserver = {
		enable = true;
		xkb = {
			layout = "gb";
			variant = "";
		};

		desktopManager.xterm.enable = false;

		windowManager.i3 = {
			enable = true;
			extraPackages = with pkgs; [
				dmenu
				i3status
			];
		};

		windowManager.xmonad = {
			enable = true;
			# enableContribAndExtras = true;

			# extraPackages = haskellPackages: [
			# 	haskellPackages.dbus
			# 	haskellPackages.xmonad-contrib
			# 	haskellPackages.monad-logger
			# ];

			# config = builtins.readFile ./home/xmonad.hs;
		};
	};

	services.desktopManager.plasma6.enable = true;
	services.displayManager.sddm = {
		enable = true;
		theme = "catppuccin-mocha";
		# package = pkgs.kdePackages.sddm;
	};

	# Configure console keymap
	console.keyMap = "uk";

	# Users
	users.users.ibrahizy = {
		# Because fish does indeed exist thanks to home-manager
		ignoreShellProgramCheck = true;
		shell = pkgs.fish;
		isNormalUser = true;
		description = "ibrahizy";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;
		wireplumber.enable = true;
	};

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-kde
		];
		config.common.default = "*";
	};

	services.flatpak.enable = true;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
