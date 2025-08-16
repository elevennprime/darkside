local M = {}

function M.get(palette, config)
	local editor = {
		ColorColumn      = {fg = palette.bg_alt, bg = palette.bg_alt}, -- used for the columns set with 'colorcolumn'
		Conceal          = {fg = palette.disabled}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor           = {fg = palette.bg_alt, bg = palette.cursor}, -- the character under the cursor
		CursorIM         = {fg = palette.bg_alt, bg = palette.cursor}, -- like Cursor, but used when in IME mode

		CursorColumn     = {link = "CursorLine"}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine       = {fg = palette.none, bg = palette.bg_cur}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.

		Directory        = {fg = palette.blue, bold = true}, -- directory names (and other special names in listings)

		-- the some good color for text that changed
		DiffAdd          = {fg = palette.fg, bg = palette.green}, -- diff mode: Added line
		DiffChange       = {fg = palette.fg, bg = palette.darkblue}, -- diff mode: Changed line
		DiffDelete       = {bg = palette.red}, -- diff mode: Deleted line
		-- DiffText         = {fg = styles.fg, bg = styles.bg_alt}, -- diff mode: Changed text within a changed line -- DEPREACTED
		-- DiffText         = {fg = styles.darkblue, bg = styles.fg, bold = true}, -- diff mode: Changed text within a changed line -- DEPREACTED
		DiffText         = {fg = palette.fg, bg = palette.darkblue, bold = true, reverse = true}, -- diff mode: Changed text within a changed line

		EndOfBuffer      = {fg = palette.line_numbers}, -- Set End of Buffer lines (~)

		-- TermCursor
		-- TermCursorNC

		ErrorMsg         = {fg = palette.error}, -- error messages

		WinSeparator     = {fg = palette.vsp}, -- Lines between window splits

		Folded           = {fg = palette.disabled}, -- line used for closed folds
		FoldColumn       = {fg = palette.blue}, -- 'foldcolumn'

		SignColumn       = {fg = palette.fg, bg = palette.bg_sign},

		IncSearch        = {fg = palette.title, bg = palette.selection, underline = true}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

		-- Substitute

		LineNr           = {fg = palette.yellow}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove      = {fg = palette.line_numbers}, -- Line number for when the relativenumber option is set, above teh cursor line.
		LineNrBelow      = {fg = palette.line_numbers}, -- Line number for when the relativenumber option is set, below teh cursor line.
		CursorLineNr     = {link = "LineNr"}, -- Like LineNr when 'cursorline' is set for the cursor line.
		-- CursorLineSign
		-- CursorLineFold
		MatchParen       = {fg = palette.yellow, bold = true}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg          = {fg = styles.fg}, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea
		-- MsgSeparator
		MoreMsg          = {fg = palette.accent}, -- |more-prompt|
		-- '@' at the end of the window, characters from 'showbreak' and other
		-- characters that do not really exist in the text (e.g., ">" displayed
		-- when a double-wide character doesn't fit at the end of the line). See
		-- also |hl-EndOfBuffer|.
		NonText          = {fg = palette.disabled},

		Normal           = {fg = palette.fg, bg = palette.bg}, -- normal text and background color
		NormalFloat      = {fg = palette.fg, bg = palette.bg}, -- normal text and background color for floating windows
		NormalNC         = {fg = palette.fg, bg = palette.bg_nc}, -- normal text and background color


		-- Popup menu:
		-- PmenuKind	Popup menu: Normal item "kind".
		-- PmenuKindSel	Popup menu: Selected item "kind".
		-- PmenuExtra	Popup menu: Normal item "extra text".
		-- PmenuExtraSel	Popup menu: Selected item "extra text".
		--
		-- Normal item
		Pmenu            = {fg = palette.fg, bg = palette.bg1},
		-- selected item
		PmenuSel         = {fg = palette.fg, bg = palette.selection},
		-- Scrollbar
		-- PmenuSbar        = {},
		-- Thumb of the scrollbar
		-- PmenuThumb       = {},

		Question         = {fg = palette.green}, -- |hit-enter| prompt and yes/no questions
		-- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- QuickFixLine     = {fg = styles.highlight, bg = styles.title, reverse = true},
		QuickFixLine     = {bg = palette.highlight},

		Search           = {fg = palette.title, bg = palette.selection, bold = true}, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey       = {fg = palette.purple}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

		SpellBad         = {fg = palette.error, undercurl = true}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap         = {fg = palette.blue, undercurl = true}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal       = {fg = palette.cyan, undercurl = true}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare        = {fg = palette.purple, undercurl = true}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

		StatusLine       = {fg = palette.fg, bg = palette.bg_alt}, -- status line of current window
		StatusLineNC     = {fg = palette.fg_alt, bg = palette.bg_alt}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		Tabline          = {fg = palette.fg},
		TabLineFill      = {fg = palette.fg}, -- tab pages line, where there are no labels
		TablineSel       = {fg = palette.bg, bg = palette.accent}, -- tab pages line, active tab page label

		Title            = {fg = palette.title, bold = true}, -- titles for output from ":set all", ":autocmd" etc.
		Visual           = {fg = palette.none, bg = palette.selection}, -- Visual mode selection
		VisualNOS        = {link = "Visual"}, -- Visual mode selection when vim is "Not Owning the Selection".

		WarningMsg       = {fg = palette.yellow}, -- warning messages

		Whitespace       = {fg = palette.disabled}, -- "nbsp", "space", "tab" and "trail" in 'listchars'

		WildMenu         = {fg = palette.orange, bold = true}, -- current match in 'wildmenu' completion

		-- For the GUI
		-- Menu
		-- Scrollbar
		-- Tooltip

		VertSplit        = {fg = palette.vsp}, -- The column separating vertically split windows

		-- Unknown
		NormalContrast   = {fg = palette.fg, bg = palette.bg_alt}, -- a help group for contrast fileypes
		FloatBorder      = {fg = palette.border, bg = palette.float}, -- floating window border

		StatusLineTerm   = {fg = palette.fg, bg = palette.active}, -- status line of current terminal window
		StatusLineTermNC = {fg = palette.disabled, bg = palette.bg}, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- ToolbarLine   = {fg = styles.fg, bg = styles.bg_alt},
		-- ToolbarButton = {fg = styles.fg, bold = true},
		NormalMode       = {fg = palette.accent}, -- Normal mode message in the cmdline
		InsertMode       = {fg = palette.green}, -- Insert mode message in the cmdline
		ReplacelMode     = {fg = palette.red}, -- Replace mode message in the cmdline
		VisualMode       = {fg = palette.purple}, -- Visual mode message in the cmdline
		CommandMode      = {fg = palette.gray}, -- Command mode message in the cmdline
		Warnings         = {fg = palette.yellow},
	}

	return editor
end

return M
