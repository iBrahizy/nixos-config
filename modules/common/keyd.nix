{ ... }:

{
	services.keyd = {
		enable = true;

		keyboards.default.settings = {
			main = {
				"102nd" = "overload(nav, 102nd)";
			};

			nav = {
				h = "left";
				j = "down";
				k = "up";
				l = "right";
			};
		};
	};
}
