return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.basics").setup({
            options = {
                basic = true,
                extra_ui = false,
                win_borders = "default",
            },
            mappings = {
                basic = true,
                option_toggle_prefix = [[\]],
                windows = true,
                move_with_alt = true,
            },
            autocommands = {
                basic = true,
                relnum_in_visual_mode = false,
                silent = false,
            },
        })
        require("mini.ai").setup({})
        require("mini.operators").setup({})
        require("mini.surround").setup({})
        require("mini.bracketed").setup({})
        require("mini.trailspace").setup({})
        require("mini.pairs").setup({})
        require("mini.bufremove").setup({})
        require("mini.comment").setup({})
        require("mini.cursorword").setup({})
        require("mini.diff").setup({})
        require("mini.extra").setup({})
        require("mini.icons").setup({})
        require("mini.indentscope").setup({})
        require("mini.git").setup({})
        require("mini.move").setup({})
        require("mini.pairs").setup({})
        require("mini.starter").setup({})
        require("mini.statusline").setup({})
        require("mini.tabline").setup({})
        local miniclue = require("mini.clue")
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })

        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
    end,
}
