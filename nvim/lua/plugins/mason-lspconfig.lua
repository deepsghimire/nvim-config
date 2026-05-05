return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "mason.nvim", "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local masonconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		masonconfig.setup({
			ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "bashls" },
			automatic_enable = true,
		})

		local lsp_cmp = require("cmp_nvim_lsp")

		for _, server_name in ipairs(masonconfig.get_installed_servers()) do
			lspconfig[server_name].setup({
				capabilities = lsp_cmp.default_capabilities(),
				-- You can add other shared options here
			})
		end
	end,
}
