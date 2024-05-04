return {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			bash = { "shellcheck" },
			python = { "flake8" },
			lua = { "luacheck" },
		},
	},
	config = function(_, opts)
		for key, value in pairs(opts) do
			require("lint")[key] = value
		end
	end,
}
