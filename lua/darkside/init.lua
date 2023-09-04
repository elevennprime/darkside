local M = {}

local config = require('darkside.config').options

-- Only define Darkside if it's the active colorshceme
function M.onColorScheme()
  if vim.g.colors_name ~= "darkside" then
    vim.cmd [[autocmd! Darkside]]
    vim.cmd [[augroup! Darkside]]
	-- vim.api.nvim_del_augroup_by_name("Darkside")
  end
end

-- Change the background for the terminal and packer windows
M.contrast = function ()
	local group = vim.api.nvim_create_augroup("Darkside", {clear = true})
	vim.api.nvim_create_autocmd("ColorScheme", {callback = function ()
		require("darkside.util").onColorScheme()
	end, group = group})

	for _, sidebar in ipairs(config.contrast_filetypes) do
		if sidebar == "terminal" then
			vim.api.nvim_create_autocmd("TermOpen", {
				command = "setlocal winhighlight=Normal:NormalContrast,SignColumn:NormalContrast",
				group = group,
			})
		else
			vim.api.nvim_create_autocmd("FileType", {
				pattern = sidebar,
				command = "setlocal winhighlight=Normal:NormalContrast,SignColumn:SignColumnFloat",
				group = group,
			})
		end
	end
end

-- Load the theme
function M.load()
    -- Set the theme environment
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.g.colors_name = "darkside"

	local palette = require('darkside.palette')
	local groups = require("darkside.group").from(palette)
	for name, values in pairs(groups) do
		vim.api.nvim_set_hl(0, name, values)
	end
end

return M
