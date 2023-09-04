local M = {}

local config = require('darkside.config').options
local collect = require("darkside.lib.collect")

function M.from(palette)
	local editor = require("darkside.group.editor").get(palette, config)
	local syntax = require("darkside.group.syntax").get(palette, config)
	local result = collect.deep_extend(editor, syntax)

	local module_names = require("darkside.config").module_names
	for _, name in ipairs(module_names) do
		local kind = type(config.modules[name])
		local opts = kind == "boolean" and { enable = config.modules[name] }
		or kind == "table" and config.modules[name]
		or {}
		-- TODO: correct this
		opts.enable = opts.enable == nil and true or opts.enable

		if opts.enable then
			result = collect.deep_extend(result, require("darkside.group.modules." .. name).get(palette, config))
		end
	end
	return result
end

return M
