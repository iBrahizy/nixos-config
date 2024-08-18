{ ... }:

let 
	relativePath = ".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg";
in
{
	# home.file."${relativePath}/autoexec.cfg".source = ./autoexec.cfg;
}
