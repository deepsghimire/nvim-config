return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "b0o/schemastore.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Configure diagnostics
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- Setup Mason-LSPConfig with handlers
        mason_lspconfig.setup({
            ensure_installed = { "basedpyright", "lua_ls", "rust_analyzer", "bashls", "gopls", "jsonls", "yamlls" },
            handlers = {
                -- Default handler for all servers
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            if client.supports_method("textDocument/inlayHint") then
                                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                            end
                        end,
                    })
                end,
                -- Specific handler for basedpyright
                ["basedpyright"] = function()
                    lspconfig.basedpyright.setup({
                        capabilities = capabilities,
                        settings = {
                            basedpyright = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    autoImportCompletions = true,
                                },
                            },
                        },
                    })
                end,
                -- Specific handler for lua_ls
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                            },
                        },
                    })
                end,
                -- JSON with SchemaStore
                ["jsonls"] = function()
                    lspconfig.jsonls.setup({
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = require("schemastore").json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
                -- YAML with SchemaStore
                ["yamlls"] = function()
                    lspconfig.yamlls.setup({
                        capabilities = capabilities,
                        settings = {
                            yaml = {
                                schemaStore = {
                                    enable = false,
                                    url = "",
                                },
                                schemas = require("schemastore").yaml.schemas(),
                            },
                        },
                    })
                end,
            },
        })
    end,
}
