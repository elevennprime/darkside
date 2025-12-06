local M = {
	default_options = {
		compile_path = vim.fn.stdpath "cache" .. "/darkside",
		contrast = {
			-- Enable contrast for sidebar-like windows (for example Nvim-Tree)
			sidebars = false,
			-- Enable contrast for floating windows
			floating_windows = false,
			-- Enable darker background for the cursor line
			cursor_line = false,
			-- Enable contrast background for line numbers
			line_numbers = false,
			-- Enable contrast background the sign column
			sign_column = false,
			-- Enable darker background for non-current windows
			non_current_windows = false,
			-- Enable lighter background for the popup menu
			popup_menu = false,
		},

		italics = {
			comments = false,
			strings = false,
			keywords = false,
			functions = false,
			variables = false,
		},

		-- Select which windows get the contrast background
		contrast_filetypes = {},

		disable = {
			colored_cursor = true,
			-- Disable window split borders
			borders = false,
			-- Disable setting the background color
			background = true,
			-- Disable setting the terminal colors
			term_colors = true,
			-- Make end-of-buffer lines invisible
			eob_lines = true
		},

		high_visibility = {
			-- Higher contrast text for lighter style
			lighter = false,
			-- Higher contrast text for darker style
			darker = false
		},

		-- Lualine style (can be 'stealth' or 'default')
		lualine_style = 'default',

		-- define custom highlights
		custom_highlights = {},

		-- Load parts of the theme asyncronously for faster startup
		async_loading = true,


		modules = {
			diagnostic = true,
			lsp_semantic = true,
			lsp = true,
			treesitter = true,
			cmp = true,
			neogit = true,
			gitsigns = true,
		},

	},
	path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
}

M.options = vim.tbl_deep_extend("force", {}, M.default_options, M.options or {})

M.module_names = {
	"diagnostic",
	"lsp_semantic",
	"lsp",
	"treesitter",
	"cmp",
	"neogit",
	"gitsigns",
}

local did_setup = false
function M.load()
	if not did_setup then M.setup() end

	local compiled_path = M.options.compile_path .. M.path_sep .. "darkside"
	local f = loadfile(compiled_path)
	if not f then
		M.compile()
		f = assert(loadfile(compiled_path), "could not load cache")
	end
	f()
end

function M.setup(user_conf)
	did_setup = true

	user_conf = user_conf or {}

	local cached_path = M.options.compile_path .. M.path_sep .. "cached"
	local file = io.open(cached_path)
	local cached = nil
	if file then
		cached = file:read()
		file:close()
	end

	local git_path = debug.getinfo(1).source:sub(2, -24) .. ".git"
	local git = vim.fn.getftime(git_path)
	local hash = require("darkside.lib.hashing").hash(user_conf)
		.. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
		.. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
		.. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend


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
