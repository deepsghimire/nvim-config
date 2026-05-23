local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Async Main Boilerplate
    s("amain", fmt([[
import asyncio

async def main():
    {}

if __name__ == "__main__":
    asyncio.run(main())
]], { i(0) })),

    -- Async Function
    s("adef", fmt([[
async def {}({}):
    {}
]], { i(1, "name"), i(2), i(0) })),

    -- Try/Except (Standard)
    s("try", fmt([[
try:
    {}
except {} as e:
    {}
]], { i(1), i(2, "Exception"), i(0) })),
}
