local path_sep = require("darkside").path_sep
local opts = require("darkside").options
local parse_style = require("darkside.lib.highlight").parse_style
local fmt = string.format

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

function M.complier()
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

	for group, color in pairs(groups) do
		if color.style then
			for _, style in pairs(color.style) do color[style] = true end
		end
		color.style = nil
		table.insert(lines, fmt([[h(0, "%s", %s)]], group, inspect(color)))
	end
	table.insert(lines, "end)")

	if vim.fn.isdirectory(opts.compile_path) == 0 then vim.fn.mkdir(opts.compile_path, "p") end

	if vim.g.darkside_debug then -- Debugging purpose
		local f = io.open(opts.compile_path .. path_sep .. "darkside.lua", "wb")
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
		io.open(opts.compile_path .. path_sep .. "darkside", "wb"),
		"Permission denied while writing compiled file to " .. opts.compile_path .. path_sep .. "darkside"
	)

	file:write(f())
	file:close()
end

return M
