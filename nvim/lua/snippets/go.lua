local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Error handling
    s("err", fmt([[
if err != nil {{
    return {}
}}
]], { i(0) })),

    -- Main function
    s("main", fmt([[
package main

func main() {{
    {}
}}
]], { i(0) })),
}
