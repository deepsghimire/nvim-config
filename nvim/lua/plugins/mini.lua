return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.basics").setup({
			options = {
				basic = true,
				extra_ui = false,
				win_borders = "default",
			},
			mappings = {
				basic = true,
				option_toggle_prefix = [[\]],
				windows = true,
				move_with_alt = true,
			},
			autocommands = {
				basic = true,
				relnum_in_visual_mode = false,
				silent = false,
			},
		})
		require("mini.ai").setup({})
		require("mini.operators").setup({})
		require("mini.surround").setup({})
		require("mini.bracketed").setup({})
		require("mini.trailspace").setup({})
	end,
}
