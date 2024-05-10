return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		ls.setup()
		require("luasnip.loaders.from_lua").load({ paths = "~/snippets" })

		vim.keymap.set({ "i" }, "<C-K>", function()
			ls.expand()
		end, { silent = true, desc = "expand snippet" })

		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			ls.jump(1)
		end, { silent = true, desc = "jump next node" })

		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			ls.jump(-1)
		end, { silent = true, desc = "jump previous node" })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true, desc = "change choice" })
	end,
}
