return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "bashls", "gopls" },
    },
}
