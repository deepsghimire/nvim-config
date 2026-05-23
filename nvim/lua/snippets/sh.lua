local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Shebang and safety flags
    s("bash", fmt([[
#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

{}
]], { i(0) })),

    -- If statement
    s("if", fmt([[
if [[ {} ]]; then
    {}
fi
]], { i(1, "condition"), i(0) })),

    -- Case for flags
    s("flags", fmt([[
while getopts ":{}" opt; do
  case ${{opt}} in
    {})
      {}
      ;;
    \?)
      echo "Invalid option: -${{OPTARG}}" >&2
      exit 1
      ;;
  esac
done
]], { i(1, "h"), i(2, "h"), i(0) })),
}
