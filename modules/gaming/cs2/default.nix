{ config, ... }:

let
	relative = ".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg";
in
{
	home-manager.users.${config.user}.home.file."${relative}/autoexec.cfg".source = ./autoexec.cfg;
}