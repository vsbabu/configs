return {
	{ "EdenEast/nightfox.nvim" },
	{ "neanias/everforest-nvim", name = "everforest", priority = 1000, opts = { everforest_enable_italic = true } },
	{ "rmehri01/onenord.nvim" },
	{ "ayu-theme/ayu-vim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { transparent_background = true } },
	{
		"LazyVim/LazyVim",
		opts = {
			ayucolor = "mirage",
			colorscheme = "everforest", -- catppuccin-frappe
		},
	},
}
