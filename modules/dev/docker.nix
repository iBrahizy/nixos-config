{ pkgs, config, ... }:

{
	virtualisation.docker.enable = true;
	environment.systemPackages = [ pkgs.docker-compose pkgs.xorg.xhost ];

	users.extraGroups.docker.members = [ config.user ];
}
