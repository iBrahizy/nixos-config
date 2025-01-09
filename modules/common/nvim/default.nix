{ ... }:

{
	programs.nixvim = {
		enable = true;

		globals = {
			mapleader = " ";
		};

		opts = {
			number = true;
			signcolumn = "yes";
			scrolloff = 5;
			hlsearch = false;
		};

		keymaps = [
			{
				action = "<leader>";
				key = "<space>";
			}
			{
				action = "<cmd>w<CR>";
				key = "<leader>w";
			}
			{
				action = "<cmd>Oil<CR>";
				key = "<leader>e";
			}
			{
				action.__raw = "vim.diagnostic.open_float";
				key = "<leader>q";
			}
		];

		files = {
			"ftplugin/nix.lua" = {
				opts = {
					expandtab = false;
					shiftwidth = 4;
					tabstop = 4;
				};
			};
		};

		colorschemes.catppuccin.enable = true;

		plugins = {
			web-devicons.enable = true;
			autoclose.enable = true;
			blink-cmp.enable = true;

			treesitter = {
				enable = true;
				settings.highlight.enable = true;
			};

			fzf-lua = {
				enable = true;
				keymaps = {
					"<leader>f" = "files";
					"<leader>/" = "live_grep";
					"<leader>b" = "buffers";

					"<leader>s" = "lsp_document_symbols";
					"<leader>S" = "lsp_workspace_symbols";
					"<leader>a" = "lsp_code_actions";
					"<leader>d" = "lsp_document_diagnostics";
					"<leader>D" = "lsp_workspace_diagnostics";

					"gd" = "lsp_definitions";
					"gD" = "lsp_declarations";
					"gi" = "lsp_implementations";
				};
			};

			indent-blankline = {
				enable = true;
				settings = {
					scope.enabled = false;
					debounce = 0;
				};
			};

			oil = {
				enable = true;
				settings = {
					columns = [
						"icon"
					];
					keymaps = {
						"<C-c>" = false;
						"<C-l>" = false;
						"<C-r>" = "actions.refresh";
						"y." = "actions.copy_entry_path";
					};
				};
			};

			lsp = {
				# Disable lsp highlighting
				onAttach = "client.server_capabilities.semanticTokensProvider = nil";
				enable = true;
				servers = {
					rust_analyzer = {
						enable = true;
						installRustc = false;
						installCargo = false;
					};
					nil_ls = {
						enable = true;
					};
				};
			};
		};
	};
}
