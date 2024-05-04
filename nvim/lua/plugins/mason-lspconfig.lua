return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "mason.nvim", "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local masonconfig = require("mason-lspconfig")

		masonconfig.setup({
			ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "bashls" },
		})

		local lsp_cmp = require("cmp_nvim_lsp")
		masonconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = lsp_cmp.default_capabilities(),
				})
			end,
		})
	end,
}
