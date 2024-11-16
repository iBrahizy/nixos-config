{ lib, ... }:

{
	services.keyd = {
		enable = true;

		keyboards.default.settings = {
			main = {
				# 102nd is backslash on the uk layout
				"102nd" = "overload(backslash-overlay, 102nd)";

				# For consistancy with the 60%
				"`" = "esc";
			};

			backslash-overlay = 
			let
				range = lib.range 1 9;
				toFAttribute = (x: { "${x}" = "f${x}"; });
				f = (x: acc: acc // toFAttribute (toString x));
				# \ + 1..9 will be mapped to F1..F9
				fKeysAttributes = lib.fold f {} range;
			in
				fKeysAttributes // 
				{
					"0" = "f10";
					"-" = "f11";

					h = "left";
					j = "down";
					k = "up";
					l = "right";

					u = "pagedown";
					i = "pageup";

					"`" = "`";
					esc = "`";
				}; 

		};

		# There is some bug with setting equals equal to something
		keyboards.default.extraConfig = ''
			[backslash-overlay]
			==f12
		'';
	};
}
