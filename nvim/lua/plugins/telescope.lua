return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			mode = "n",
			desc = "find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_files()
			end,
			mode = "n",
			desc = "find git files",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = "n",
			desc = "goto buffer",
		},

		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = "n",
			desc = "live grep",
		},

		{
			"<leader>sM",
			function()
				require("telescope.builtin").man_pages()
			end,
			mode = "n",
			desc = "man page",
		},

		{
			"<leader>sm",
			function()
				require("telescope.builtin").marks()
			end,
			mode = "n",
			desc = "lists mark",
		},
		{
			'<leader>s"',
			function()
				require("telescope.builtin").registers()
			end,
			mode = "n",
			desc = "lookup registers",
		},

		{
			"<leader>sk",
			function()
				require("telescope.builtin").keymaps()
			end,
			mode = "n",
			desc = "keymaps",
		},
	},
}
