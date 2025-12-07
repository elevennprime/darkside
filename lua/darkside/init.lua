---@type Darkside
local M = {
	default_options = {
		compile_path = vim.fn.stdpath "cache" .. "/darkside",
		transparent_background = false,
		float = {
			transparent = true,
		},
		default_modules = true,
		modules = {
			cmp = true,
			neogit = true,
			gitsigns = true,
		},

	},
}

M.options = vim.tbl_deep_extend("force", {}, M.default_options, M.options or {})

local did_setup = false
function M.load()
	if not did_setup then M.setup() end

	local compiler = require("darkside.lib.compiler")
	local f = compiler.get_compiled()
	if not f then
		compiler.compile()
		f = assert(compiler.get_compiled(), "could not load cache")
	end
	f()
end

---@type fun(user_conf: DarksideOptions?)
function M.setup(user_conf)
	did_setup = true

	M.options = vim.tbl_deep_extend("keep", user_conf or {}, M.default_options)

	local compiler = require("darkside.lib.compiler")
	if compiler.should_recompile(user_conf) then compiler.compile(user_conf) end
end

return M
