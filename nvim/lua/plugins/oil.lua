return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
		vim.keymap.set({ "n" }, "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set({ "n" }, "<leader>ef", "<CMD>Oil --float<CR>", { desc = "Open parent directory in floating" })
	end,
}
