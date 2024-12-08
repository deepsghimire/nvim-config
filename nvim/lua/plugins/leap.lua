return {
    "ggandor/leap.nvim",
    config = function()
        vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap)')
    end
}
