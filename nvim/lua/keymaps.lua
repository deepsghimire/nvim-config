local M = {}

M.mappings = {}

function M:map(mode, lhs, rhs, args)
	self.mappings[#self.mappings + 1] = { mode = mode, lhs = lhs, rhs = rhs, args = args }
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

M:map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
M:map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

M:map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
M:map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
M:map({ "n", "v" }, "<leader>cf", function()
	LazyVim.format({ force = true })
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

-- stylua: ignore start

-- toggle options
-- M:map("n", "<leader>uf", function() LazyVim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
-- M:map("n", "<leader>uF", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
-- M:map("n", "<leader>us", function() LazyVim.toggle("spell") end, { desc = "Toggle Spelling" })
-- M:map("n", "<leader>uw", function() LazyVim.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- M:map("n", "<leader>uL", function() LazyVim.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- M:map("n", "<leader>ul", function() LazyVim.toggle.number() end, { desc = "Toggle Line Numbers" })
-- M:map("n", "<leader>ud", function() LazyVim.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- M:map("n", "<leader>uc", function() LazyVim.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
--   map( "n", "<leader>uh", function() LazyVim.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
-- end
-- M:map("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })
-- M:map("n", "<leader>ub", function() LazyVim.toggle("background", false, {"light", "dark"}) end, { desc = "Toggle Background" })
--
-- -- lazygit
-- M:map("n", "<leader>gg", function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
-- M:map("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
-- M:map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
--
-- M:map("n", "<leader>gf", function()
--   local git_path = vim.api.nvim_buf_get_name(0)
--   LazyVim.lazygit({args = { "-f", vim.trim(git_path) }})
-- end, { desc = "Lazygit Current File History" })

-- quit
M:map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
M:map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })


-- floating terminal
-- local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
-- M:map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
-- M:map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
-- M:map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
-- M:map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

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


function M:setup()
	for i, mapping in pairs(self.mappings) do
		vim.keymap.set(mapping.mode, mapping.lhs, mapping.rhs, mapping.args)
	end
end

return M
