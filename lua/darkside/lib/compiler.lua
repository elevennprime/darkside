local B = bit or bit32 or require "darkside.lib.native_bit"
local compile_path = require("darkside").options.compile_path
local fmt = string.format

local path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)

local M = {}

-- Credit: https://github.com/EdenEast/nightfox.nvim

local function inspect(t)
	local list = {}
	for k, v in pairs(t) do
		local tv = type(v)
		if tv == "string" then
			table.insert(list, fmt([[%s = "%s"]], k, v))
		elseif tv == "table" then
			table.insert(list, fmt([[%s = %s]], k, inspect(v)))
		else
			table.insert(list, fmt([[%s = %s]], k, tostring(v)))
		end
	end

	table.sort(list)
	return fmt([[{ %s }]], table.concat(list, ", "))
end



local hash_str = function(str) -- djb2, https://theartincode.stanis.me/008-djb2/
	local hash = 5381
	for i = 1, #str do
		hash = B.lshift(hash, 5) + hash + string.byte(str, i)
	end
	return hash
end

local function hash(v) -- Xor hashing: https://codeforces.com/blog/entry/85900
	local t = type(v)
	if t == "table" then
		local _hash = 0
		for p, u in next, v do
			_hash = B.bxor(_hash, hash_str(p .. hash(u)))
		end
		return _hash
	elseif t == "function" then
		return hash(v(require("darkside.palette")))
	end
	return tostring(v)
end

local function compute_state_hash(opts)
	local git_path = debug.getinfo(1).source:sub(2, -24) .. ".git"
	local git = vim.fn.getftime(git_path)
	return hash(opts)
		.. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
		.. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
		.. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend
end

function M.compile(user_conf)
	local palette = require('darkside.palette')
	local groups = require("darkside.groups").from(palette)

	local lines = {
		fmt(
			[[
				return string.dump(function()
				local h = vim.api.nvim_set_hl
				if vim.g.colors_name then vim.cmd("hi clear") end
				vim.o.termguicolors = true
				vim.g.colors_name = "%s"
				vim.o.background = "%s"
			]],
			"darkside",
			"dark"
		),
	}

	local tbl = vim.tbl_deep_extend("keep", groups.modules, groups.syntax, groups.editor)
	for group, color in pairs(tbl) do
		if color.style then
			for _, style in pairs(color.style) do color[style] = true end
		end
		color.style = nil
		table.insert(lines, fmt([[h(0, "%s", %s)]], group, inspect(color)))
	end
	table.insert(lines, "end)")

	if vim.fn.isdirectory(compile_path) == 0 then vim.fn.mkdir(compile_path, "p") end

	if vim.g.darkside_debug then -- Debugging purpose
		local f = io.open(compile_path .. path_sep .. "darkside.lua", "wb")
		if f then
			f:write(table.concat(lines, "\n"))
			f:close()
		end
	end

	local f = loadstring(table.concat(lines, "\n"))
	if not f then
		local err_path = (path_sep == "/" and "/tmp" or os.getenv "TMP") .. "/darkside_error.lua"
		print(string.format(
			[[
				Darkside (error): Most likely some mistake made in your darkside config
				You can open `%s` for debugging

				If you think this is a bug, kindly open an issue and attach `%s` file
				Below is the error message that we captured:
			]],
			err_path,
			err_path
		))
		local err = io.open(err_path, "wb")
		if err then
			err:write(table.concat(lines, "\n"))
			err:close()
		end
		dofile(err_path)
		return
	end

	local file = assert(
		io.open(compile_path .. path_sep .. "darkside", "wb"),
		"Permission denied while writing compiled file to " .. compile_path .. path_sep .. "darkside"
	)

	file:write(f())
	file:close()


	local cached_path = compile_path .. path_sep .. "cached"
	local hash_file = io.open(cached_path, "wb")
	if hash_file then
		hash_file:write(compute_state_hash(user_conf))
		hash_file:close()
	end
end

---@return boolean
function M.should_recompile(user_conf)
	local cached_path = compile_path .. path_sep .. "cached"
	local file = io.open(cached_path)
	local cached = nil
	if file then
		cached = file:read()
		file:close()
	end
	return cached ~= compute_state_hash(user_conf)
end

function M.get_compiled()
	return loadfile(compile_path .. path_sep .. "darkside")
end

return M
