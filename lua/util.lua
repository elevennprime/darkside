local util = {}

local darkside = require('highlights')
local config = require('config').options

-- Only define Darkside if it's the active colorshceme
function util.onColorScheme()
  if vim.g.colors_name ~= "darkside" then
    vim.cmd [[autocmd! Darkside]]
    vim.cmd [[augroup! Darkside]]
	-- vim.api.nvim_del_augroup_by_name("Darkside")
  end
end

-- Change the background for the terminal and packer windows
util.contrast = function ()
	local group = vim.api.nvim_create_augroup("Darkside", {clear = true})
	vim.api.nvim_create_autocmd("ColorScheme", {callback = function ()
		require("util").onColorScheme()
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
function util.load()
    -- Set the theme environment
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.g.colors_name = "darkside"

    -- Import tables for the base, syntax, treesitter and lsp
    local editor = darkside.loadEditor()
    local syntax = darkside.loadSyntax()
    local treesitter = darkside.loadTreeSitter()
	local lsp = darkside.loadLSP()

	-- Apply base colors
    for group, colors in pairs(editor) do
		vim.api.nvim_set_hl(0, group, colors)
    end

	-- Apply basic syntax colors
    for group, colors in pairs(syntax) do
		vim.api.nvim_set_hl(0, group, colors)
    end

	-- Apply treesitter colors
    for group, colors in pairs(treesitter) do
		vim.api.nvim_set_hl(0, group, colors)
    end

	-- Apply lsp colors
	for group, colors in pairs(lsp) do
		vim.api.nvim_set_hl(0, group, colors)
	end
end

return util
