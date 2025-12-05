local Config = {}

local defaults = {
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
}

Config.options = {}

Config.setup = function(options)
	Config.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

Config.module_names = {
	"diagnostic",
	"lsp_semantic",
	"lsp",
	"treesitter",
	"cmp",
	"neogit",
	"gitsigns",
}

Config.setup()

return Config
