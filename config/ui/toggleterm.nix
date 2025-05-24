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
				};
			};
		};

		keymaps = [
			{
				mode = "n";
				key = "<C-/>";
				action = "ToggleTerm";
				options.desc = "Toggle Terminal";
			}

			# Take over lazygit here
			{
				mode = "n";
				key = "<leader>gg";
				action = "<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd='lazygit', hiddren = true }):toggle<cr>";
			}
		];
	};
}
