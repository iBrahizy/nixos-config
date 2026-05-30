# TY SZWAGI
# https://github.com/Szwagi

{ modules, config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.csgo;

    srcLaunchCSGO = pkgs.writeText "launch-csgo" ''
        #!/usr/bin/env bash
        set -euo pipefail

        ${pkgs.xorg.xrandr}/bin/xrandr --output 0 --primary
        read xxxx width height < <(${pkgs.xorg.xrandr}/bin/xrandr --query | grep -Po 'primary \d+x\d+' | tr x ' ')
        echo "mat_setvideomode $width $height 1" > "$HOME/.local/share/Steam/steamapps/common/csgo legacy/csgo/cfg/setvideomode.cfg"

        rm -rf "$HOME/.local/share/Steam/steamapps/common/csgo legacy/platform/vgui/fonts" || true

        export LD_PRELOAD="${pkgs.SDL2}/lib/libSDL2.so"

        export MANGHUD_CONFIGFILE=${modules}/gaming/mangohud.conf

        ${pkgs.gamemode}/bin/gamemoderun ${pkgs.libstrangle}/bin/strangle 237 ${pkgs.mangohud}/bin/mangohud "$@" -- -windowed -width 1920 -height 1080 -vulkan -nologo -novid 
         '';

    launchCSGO = pkgs.stdenv.mkDerivation {
        name = "launch-csgo";
        dontUnpack = true;
        nativeBuildInputs = [];
        buildInputs = [];
        installPhase = ''
            mkdir -p $out/bin
            cp "${srcLaunchCSGO}" "$out/bin/launch-csgo"
            chmod +x "$out/bin/launch-csgo"
        '';
    };
in
{
    options.modules.csgo = {
        enable = mkEnableOption "csgo";
    };

    config = mkIf cfg.enable {
        environment.systemPackages = [
            launchCSGO
        ];
    };
}
