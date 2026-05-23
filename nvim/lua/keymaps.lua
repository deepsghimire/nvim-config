local M = {}

M.mappings = {}
M.lsp_mappings = {}

function M:map(mode, lhs, rhs, args)
    self.mappings[#self.mappings + 1] = { mode = mode, lhs = lhs, rhs = rhs, args = args }
end

function M:lmap(mode, lhs, rhs, args)
    self.lsp_mappings[#self.lsp_mappings + 1] = { mode = mode, lhs = lhs, rhs = rhs, args = args }
end

-- better up/down
M:map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
M:map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
M:map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
M:map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
M:map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
M:map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
M:map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
M:map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
M:map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
M:map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
M:map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
M:map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
M:map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
M:map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
M:map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
M:map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
M:map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
M:map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
M:map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
M:map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
M:map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
M:map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
M:map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
M:map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
M:map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
M:map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
M:map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
M:map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
M:map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
M:map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
M:map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
M:map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
M:map("i", ",", ",<c-g>u")
M:map("i", ".", ".<c-g>u")
M:map("i", ";", ";<c-g>u")

-- save file
M:map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
M:map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
M:map("v", "<", "<gv")
M:map("v", ">", ">gv")

-- lazy
-- M:map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
M:map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- fzf-lua
M:map("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Find Files" })
M:map("n", "<leader>fg", function() require("fzf-lua").git_files() end, { desc = "Find Git Files" })
M:map("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "Find Buffers" })
M:map("n", "<leader>sg", function() require("fzf-lua").live_grep() end, { desc = "Live Grep" })
M:map("n", "<leader>sM", function() require("fzf-lua").man_pages() end, { desc = "Man Pages" })
M:map("n", "<leader>sm", function() require("fzf-lua").marks() end, { desc = "Marks" })
M:map("n", '<leader>s"', function() require("fzf-lua").registers() end, { desc = "Registers" })
M:map("n", "<leader>sk", function() require("fzf-lua").keymaps() end, { desc = "Keymaps" })
M:map("n", "<leader>ss", function() require("fzf-lua").lsp_document_symbols() end, { desc = "Document Symbols" })

-- mini.files
M:map("n", "<leader>fm", function() require("mini.files").open() end, { desc = "Open Mini Files" })
M:map("n", "<leader>fM", function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end, { desc = "Open Mini Files (Current File)" })

-- mini.splitjoin
M:map("n", "gS", function() require("mini.splitjoin").toggle() end, { desc = "Toggle Split/Join" })

-- flash
M:map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
M:map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
M:map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
M:map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
M:map({ "c" }, "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

M:map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
M:map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

M:map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
M:map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
M:map({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
M:map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
M:map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
M:map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
M:map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
M:map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
M:map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
M:map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- quit
M:map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
M:map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- toggles
M:map("n", "<leader>uh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

M:map("n", "<leader>ud", function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle Diagnostic Virtual Text" })

-- git context (mini.diff / mini.git)
M:map("n", "]h", function() require("mini.diff").goto_hunk("next") end, { desc = "Next Hunk" })
M:map("n", "[h", function() require("mini.diff").goto_hunk("prev") end, { desc = "Prev Hunk" })
M:map({ "n", "v" }, "<leader>ghs", function() require("mini.diff").operator("apply") end, { desc = "Stage Hunk" })
M:map({ "n", "v" }, "<leader>ghr", function() require("mini.diff").operator("reset") end, { desc = "Reset Hunk" })
M:map("n", "<leader>ghS", function() require("mini.diff").toggle_overlay() end, { desc = "Toggle Hunk Overlay" })
M:map("n", "<leader>gb", function() require("mini.git").show_range_history() end, { desc = "Git Blame (Range)" })
M:map("n", "<leader>gB", function() require("mini.git").show_at_cursor() end, { desc = "Git Blame (Cursor)" })

M:map("n", "<leader>m", "<cmd>edit ~/scratch.md<cr>", { desc = "open Scratch" })

-- Terminal Mappings
M:map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
M:map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
M:map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
M:map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
M:map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
M:map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
M:map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
M:map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
M:map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
M:map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
M:map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
M:map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
M:map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- tabs
M:map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
M:map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
M:map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
M:map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
M:map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
M:map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

M:lmap("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
M:lmap("n", "gr", vim.lsp.buf.references, { desc = "References" })
M:lmap("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
M:lmap("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
M:lmap("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
M:lmap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
M:lmap("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
M:lmap("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
M:lmap({ "n", "v" }, "<leader>ca", function() require("fzf-lua").lsp_code_actions() end, { desc = "Code Action" })
M:lmap({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
M:lmap("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

local function on_attach_lsp_keymaps(_, bufnr)
    for _, map in ipairs(M.lsp_mappings) do
        local opts = vim.tbl_extend("force", map.args or {}, { buffer = bufnr })
        vim.keymap.set(map.mode or "n", map.lhs, map.rhs, opts)
    end
end


function M:setup()
    for _, mapping in pairs(self.mappings) do
        vim.keymap.set(mapping.mode, mapping.lhs, mapping.rhs, mapping.args)
    end
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client then
                on_attach_lsp_keymaps(client, args.buf)
            end
        end


    })
end

return M
