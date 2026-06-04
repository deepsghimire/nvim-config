return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        local fzf = require("fzf-lua")
        fzf.setup({
            -- 1. Global defaults for ALL finders (files, grep, buffers, etc.)
            defaults = {
                actions = {
                    -- Forces ctrl-g to dump EVERYTHING into quickfix
                    ["ctrl-q"] = fzf.actions.file_to_qf,
                },
            },
            -- 2. Force the fzf binary interface to accept it globally
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
        })
    end,
}
