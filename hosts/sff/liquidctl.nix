{ pkgs, ... }:

let
	liquidctl = (pkgs.liquidctl.overridePythonAttrs (oldAttrs: rec {
		version = "1.14.0";

		src = pkgs.fetchFromGitHub {
			owner = oldAttrs.pname;
			repo = oldAttrs.pname;
			tag = "v${version}";
			hash = "sha256-HkMxYULeWcAYdlEI4N4qv7AGh/+xY0zuvV2mFPStPq8=";
		};

		patches = [ ];

		propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [ pkgs.python312Packages.psutil ];

		postInstall = oldAttrs.postInstall + ''
			cp extra/yoda.py $out/bin/yoda
		'';
	}));

	aioScript = pkgs.writeScript "aio-startup-script" ''
        #!/bin/sh
        ${liquidctl}/bin/liquidctl initialize all
        ${liquidctl}/bin/yoda --match Kraken control fan with "(20,20), (40,30), (50,40), (60,50), (75,70), (80,100)" on k10temp.tctl &
        ${liquidctl}/bin/yoda --match Kraken control pump with "(20,20), (40,30), (50,40), (60,50), (75,70), (80,100)" on k10temp.tctl &
    '';
in
{
	environment.systemPackages = [
		liquidctl
	];

	systemd.services.aio = {
		description = "NZXT Kraken fan curve service";
		wantedBy = [ "default.target" ];
		serviceConfig = {
			Type = "forking";
			ExecStart = aioScript;
		};
	};
}
