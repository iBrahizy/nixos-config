{ ... }:

{
	home-manager.users.ibrahizy = {
		programs.gtk = {
			enable = true;
			theme = "Breeze";
		};

		programs.qt = {
			enable = true;
			qtStyle = "Breeze";
		};
		
		xsettings = {
			enable = true;
			settings = {
				"CursorThemeName" = "Breeze";
			};
		};
	};
}

