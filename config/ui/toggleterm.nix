{ lib, config, ...}: 
{
	options = {
		toggleterm.enable = lib.mkEnableOption "Enable toggleterm module";
	};

	config = lib.mkIf config.toggleterm.enable {
		plugins.toggleterm = {
			enable = true;
			settings = {
				direction = "float";
				float_opts = {
					border = "curved";
					open_mapping = "<C-/>";
				};
			};
		};

		keymaps = [
			{
				mode = [
					"n"
					"t"
				];
				key = "<C-/>";
				action = "<cmd>ToggleTerm<cr>";
				options.desc = "Toggle Terminal";
			}

			# Take over lazygit here
			{
				mode = "n";
				key = "<leader>gg";
				action = "<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()<cr>";
			}
		];
	};
}
