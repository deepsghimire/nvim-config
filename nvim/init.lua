local options = require("options")
local keymaps = require("keymaps")

local function configure()
	options:setup()
	keymaps:setup()
end

configure()
