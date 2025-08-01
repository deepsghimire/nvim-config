return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local masonconfig = require("mason-lspconfig")

        masonconfig.setup({
            ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "bashls" },
        })
    end,
}
