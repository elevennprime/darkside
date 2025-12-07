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
	path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
}

M.options = vim.tbl_deep_extend("force", {}, M.default_options, M.options or {})

local did_setup = false
function M.load()
	if not did_setup then M.setup() end

	local compiled_path = M.options.compile_path .. M.path_sep .. "darkside"
	local f = loadfile(compiled_path)
	if not f then
		require("darkside.lib.compiler").complier()
		f = assert(loadfile(compiled_path), "could not load cache")
	end
	f()
end

---@type fun(user_conf: DarksideOptions?)
function M.setup(user_conf)
	did_setup = true

	user_conf = user_conf or {}

	M.options = vim.tbl_deep_extend("keep", user_conf, M.default_options)

	-- Get cached hash
	local cached_path = M.options.compile_path .. M.path_sep .. "cached"
	local file = io.open(cached_path)
	local cached = nil
	if file then
		cached = file:read()
		file:close()
	end

	-- Compute the current hash
	local git_path = debug.getinfo(1).source:sub(2, -24) .. ".git"
	local git = vim.fn.getftime(git_path)
	local hash = require("darkside.lib.hashing").hash(user_conf)
		.. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
		.. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
		.. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend


	-- Recompile if hash changed
	if cached ~= hash then
		require("darkside.lib.compiler").complier()
		file = io.open(cached_path, "wb")
		if file then
			file:write(hash)
			file:close()
		end
	end
end

return M
