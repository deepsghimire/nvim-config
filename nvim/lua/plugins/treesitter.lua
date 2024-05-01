return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "c", "diff", "lua", "python", "bash", "vim" },

			auto_install = true,

			highlight = { enable = true, additional_vim_regex_highlighting = false },

			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["as"] = "@scope",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
					include_surrounding_whitespace = false,
				},

				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
						["<leader>A"] = "@parameter.outer",
					},
				},

				move = {
					enable = true,
					set_jumps = true,

					goto_next_start = {
						["]m"] = "@function.outer",
						["]["] = "@class.outer",
					},

					goto_next_end = {
						["]M"] = "@function.outer",
						["]]"] = "@class.outer",
					},

					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},

					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		})
	end,
}
