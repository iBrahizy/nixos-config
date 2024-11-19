{ ... }:

{
	services.keyd = {
		enable = true;

		keyboards.default.settings = {
			global = {
				overload_tap_timeout = 400;
			};

			main = {
				# 102nd is backslash on the uk layout
				"102nd" = "overload(backslash-overlay, 102nd)";
				# For consistancy with the 60%
				"`" = "esc";
			};

			backslash-overlay = {
				"1" = "f1";
				"2" = "f2";
				"3" = "f3";
				"4" = "f4";
				"5" = "f5";
				"6" = "f6";
				"7" = "f7";
				"8" = "f8";
				"9" = "f9";
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

				backspace = "delete";

				o = "enter";
			}; 

		};

		# There is some bug with setting equals equal to something
		keyboards.default.extraConfig = ''
			[backslash-overlay]
			==f12
		'';
	};
}
