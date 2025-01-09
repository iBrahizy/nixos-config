{ pkgs }:

let
	helix = pkgs.unstable.helix;
in
pkgs.stdenv.mkDerivation {
	name = "${helix.pname}-patched";

	src = helix;

	buildInputs = [ pkgs.bsdiff ];
	phases = [ "installPhase" ];

	installPhase = ''
		mkdir -p $out/bin
		cp ${helix}/bin/hx $out/bin/hx-unpatched
		cp ${helix}/share $out/bin/share -r
		bspatch $out/bin/hx-unpatched $out/bin/hx ${./inline-diagnostic-timeout.binpatch}
		chmod +x $out/bin/hx
		rm $out/bin/hx-unpatched
	'';
}
