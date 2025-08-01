local options = require("options")
local keymaps = require("keymaps")
local plugman = require("plugman")

local function configure()
	options:setup()
	keymaps:setup()
	plugman:setup()
end

configure()
