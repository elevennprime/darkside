local colors = require('palette')
local config = require('config').options

local theme = {}

theme.loadEditor = function()
	-- Editor highlight groups
	local editor = {
		ColorColumn      = {fg = colors.red, bg = colors.red}, -- used for the columns set with 'colorcolumn'
		Conceal          = {fg = colors.disabled}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor           = {fg = colors.bg_alt, bg = colors.cursor}, -- the character under the cursor
		CursorIM         = {fg = colors.bg_alt, bg = colors.cursor}, -- like Cursor, but used when in IME mode

		CursorColumn     = {link = "CursorLine"}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine       = {fg = colors.none, bg = colors.bg_cur}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.

		Directory        = {fg = colors.blue, bold = true}, -- directory names (and other special names in listings)

		-- the some good color for text that changed
		-- DiffAdd          = {fg = colors.fg, bg = colors.green}, -- diff mode: Added line
		DiffAdd          = {fg = colors.fg, bg = colors.green, bold = true}, -- diff mode: Added line
		DiffChange       = {fg = colors.fg, bg = colors.darkblue}, -- diff mode: Changed line
		DiffDelete       = {bg = colors.red}, -- diff mode: Deleted line
		-- DiffText         = {fg = colors.fg, bg = colors.bg_alt}, -- diff mode: Changed text within a changed line -- DEPREACTED
		-- DiffText         = {fg = colors.darkblue, bg = colors.fg, bold = true}, -- diff mode: Changed text within a changed line -- DEPREACTED
		DiffText         = {fg = colors.fg, bg = colors.darkblue, bold = true, reverse = true}, -- diff mode: Changed text within a changed line

		EndOfBuffer      = {fg = colors.line_numbers}, -- Set End of Buffer lines (~)

		-- TermCursor
		-- TermCursorNC

		ErrorMsg         = {fg = colors.error}, -- error messages

		WinSeparator     = {fg = colors.vsp}, -- Lines between window splits

		Folded           = {fg = colors.disabled}, -- line used for closed folds
		FoldColumn       = {fg = colors.blue}, -- 'foldcolumn'

		SignColumn       = {fg = colors.fg, bg = colors.bg_sign},

		IncSearch        = {fg = colors.title, bg = colors.selection, underline = true}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

		-- Substitute

		LineNr           = {fg = colors.line_numbers, bold = true}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove      = {fg = colors.line_numbers}, -- Line number for when the relativenumber option is set, above teh cursor line.
		LineNrBelow      = {fg = colors.line_numbers}, -- Line number for when the relativenumber option is set, below teh cursor line.
		-- Like LineNr when 'cursorline' is set for the cursor line.
		CursorLineNr     = {fg = colors.yellow, bold = true},
		-- CursorLineSign
		-- CursorLineFold
		MatchParen       = {fg = colors.yellow, bold = true}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg          = {fg = colors.fg}, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea
		-- MsgSeparator
		MoreMsg          = {fg = colors.accent}, -- |more-prompt|
		-- '@' at the end of the window, characters from 'showbreak' and other
		-- characters that do not really exist in the text (e.g., ">" displayed
		-- when a double-wide character doesn't fit at the end of the line). See
		-- also |hl-EndOfBuffer|.
		NonText          = {fg = colors.disabled},

		Normal           = {fg = colors.fg, bg = colors.bg}, -- normal text and background color
		NormalFloat      = {fg = colors.fg, bg = colors.float}, -- normal text and background color for floating windows
		NormalNC         = {fg = colors.fg, bg = colors.bg_nc}, -- normal text and background color

		-- Pmenu
		PmenuSel         = {fg = colors.contrast, bg = colors.accent}, -- Popup menu: selected item.
		-- PmenuSbar
		-- PmenuThumb

		Question         = {fg = colors.green}, -- |hit-enter| prompt and yes/no questions
		-- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- QuickFixLine     = {fg = colors.highlight, bg = colors.title, reverse = true},
		QuickFixLine     = {fg = colors.fg},

		Search           = {fg = colors.title, bg = colors.selection, bold = true}, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey       = {fg = colors.purple}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|

		SpellBad         = {fg = colors.error, italic = true, undercurl = true}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap         = {fg = colors.blue, italic = true, undercurl = true}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal       = {fg = colors.cyan, italic = true, undercurl = true}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare        = {fg = colors.purple, italic = true, undercurl = true}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

		StatusLine       = {fg = colors.fg, bg = colors.bg_alt}, -- status line of current window
		StatusLineNC     = {fg = colors.fg_alt, bg = colors.bg_alt}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		Tabline          = {fg = colors.fg},
		TabLineFill      = {fg = colors.fg}, -- tab pages line, where there are no labels
		TablineSel       = {fg = colors.bg, bg = colors.accent}, -- tab pages line, active tab page label

		Title            = {fg = colors.title, bold = true}, -- titles for output from ":set all", ":autocmd" etc.
		Visual           = {fg = colors.none, bg = colors.selection}, -- Visual mode selection
		VisualNOS        = {link = "Visual"}, -- Visual mode selection when vim is "Not Owning the Selection".

		WarningMsg       = {fg = colors.yellow}, -- warning messages

		Whitespace       = {fg = colors.disabled}, -- "nbsp", "space", "tab" and "trail" in 'listchars'

		WildMenu         = {fg = colors.orange, bold = true}, -- current match in 'wildmenu' completion

		-- For the GUI
		-- Menu
		-- Scrollbar
		-- Tooltip

		VertSplit        = {fg = colors.vsp}, -- The column separating vertically split windows

		-- Unknown
		NormalContrast   = {fg = colors.fg, bg = colors.bg_alt}, -- a help group for contrast fileypes
		FloatBorder      = {fg = colors.border, bg = colors.float}, -- floating window border

		StatusLineTerm   = {fg = colors.fg, bg = colors.active}, -- status line of current terminal window
		StatusLineTermNC = {fg = colors.disabled, bg = colors.bg}, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- ToolbarLine   = {fg = colors.fg, bg = colors.bg_alt},
		-- ToolbarButton = {fg = colors.fg, bold = true},
		NormalMode       = {fg = colors.accent}, -- Normal mode message in the cmdline
		InsertMode       = {fg = colors.green}, -- Insert mode message in the cmdline
		ReplacelMode     = {fg = colors.red}, -- Replace mode message in the cmdline
		VisualMode       = {fg = colors.purple}, -- Visual mode message in the cmdline
		CommandMode      = {fg = colors.gray}, -- Command mode message in the cmdline
		Warnings         = {fg = colors.yellow},
	}

	-- Options:
	-- Nvim-Cmp style options
	if config.contrast.popup_menu then
		editor.Pmenu      = {fg = colors.fg, bg = colors.border} -- Popup menu: normal item.
		editor.PmenuSbar  = {bg = colors.active} -- Popup menu: scrollbar.
		editor.PmenuThumb = {bg = colors.fg} -- Popup menu: Thumb of the scrollbar.
	else
		editor.Pmenu      = {fg = colors.fg, bg = colors.contrast} -- Popup menu: normal item.
		editor.PmenuSbar  = {bg = colors.contrast} -- Popup menu: scrollbar.
		editor.PmenuThumb = {bg = colors.selection} -- Popup menu: Thumb of the scrollbar.
	end

	return editor
end


theme.loadSyntax = function ()
	-- Syntax highlight groups
	local syntax = {
		-- Comment: any comment
		Comment             = {fg = colors.comments},

		--[[
			Constant: any constant
			String: any string
			Character: any character constant: 'c', '\n'
			Number: a number constant: 5
			Boolean: a boolean constant: TRUE, false
			Float: a floating point constant: 2.3e10
		]]
		Constant            = {fg = colors.fg},
		String              = {fg = colors.green},
		Character           = {fg = colors.orange},
		Number              = {fg = colors.fg},
		Boolean             = {fg = colors.red1},
		Float               = {fg = colors.fg},

		--[[
			Identifier: any variable name
			Function: italic funtion names
		]]
		Identifier          = {fg = colors.fg, italic = config.italics.variables},
		Function            = {fg = colors.fg},

		--[[
			Statement: any statement
			Conditional: italic if, then, else, endif, switch, etc.
			Repeat: italic any other keyword
			Label: case, default, etc.
			Operator: sizeof", "+", "*", etc.
			Keyword: italic for, do, while, etc.
			Exception: try, catch, throw
		]]
		Statement           = {fg = colors.cyan},
		Conditional         = {fg = colors.yellow, bold = true},
		Repeat              = {fg = colors.yellow, bold = true},
		Label               = {fg = colors.fg, bold = true},
		Operator            = {fg = colors.fg},
		Keyword             = {fg = colors.yellow, bold = true},
		Exception           = {fg = colors.yellow, bold = true},

		--[[
			PreProc: generic Preprocessor
			Include: preprocessor #include
			Define: preprocessor #define
			Macro: same as Define
			PreCondit: preprocessor #if, #else, #endif, etc.
			Type: int, long, char, etc.
			StorageClass: static, register, volatile, etc.
			Structure: struct, union, enum, etc.
			Typedef: A typedef
		]]
		PreProc             = {fg = colors.gray},
		Include             = {fg = colors.pink1},
		Define              = {fg = colors.gray},
		Macro               = {fg = colors.gray},
		PreCondit           = {fg = colors.gray},
		Type                = {fg = colors.fg},
		StorageClass        = {fg = colors.cyan},
		Structure           = {fg = colors.yellow, bold = true},
		Typedef             = {fg = colors.red},

		--[[
			Special: any special symbol
			SpecialChar: special character in a constant
			Tag: you can use CTRL-] on this
			Delimiter: character that needs attention like , or .
			SpecialComment: special things inside a comment
			Debug: debugging statements
		]]
		Special             = {fg = colors.fg},
		SpecialChar         = {fg = colors.disabled},
		Tag                 = {fg = colors.red},
		Delimiter           = {fg = colors.fg},
		SpecialComment      = {link = "Comment"},
		Debug               = {fg = colors.red},

		-- Underlined: text that stands out, HTML links
		Underlined          = {fg = colors.link, underline = true},

		-- Ignore: left blank, hidden
		Ignore              = {fg = colors.disabled},

		-- Error: any erroneous construct
		Error               = {fg = colors.error, bold = true, underline = true},

		-- Todo: anything that needs extra attention; mostly the keywords TODO HACK FIXME and XXX
		Todo                = {fg = colors.orange, bold = true},

		-- Extra highlights
		htmlLink            = {fg = colors.link, underline = true},
		htmlTagName         = {fg = colors.pink1},

		htmlArg             = {fg = colors.fg},
		htmlH1              = {fg = colors.cyan, bold = true},
		htmlH2              = {fg = colors.red, bold = true},
		htmlH3              = {fg = colors.green, bold = true},
		htmlH4              = {fg = colors.yellow, bold = true},
		htmlH5              = {fg = colors.purple, bold = true},

		xmlTagName          = {link = "htmlTagName"},
		xmlTagN             = {link = "xmlTagName"},
		xmlAttrib           = {link = "htmlArg"},

		markdownH1          = {fg = colors.cyan, bold = true},
		markdownH2          = {fg = colors.red, bold = true},
		markdownH3          = {fg = colors.green, bold = true},
		markdownH1Delimiter = {fg = colors.cyan},
		markdownH2Delimiter = {fg = colors.red},
		markdownH3Delimiter = {fg = colors.green},

		healthError       = {fg = colors.error},
		healthSuccess     = {fg = colors.green},
		healthWarning     = {fg = colors.yellow},

		-- Line numbers for quickfix lists
		qfLineNr          = {link = "QuickFixLine"},

		-- nvim cmp
		PmenuSel                 = {fg = "NONE", bg = "#282C34"},
		Pmenu                    = {fg = colors.fg, bg = "#22252A"},

		CmpItemAbbrDeprecated    = {fg = "#7E8294", bg = "NONE"},
		CmpItemAbbrMatch         = {fg = "#82AAFF", bg = "NONE", bold = true},
		CmpItemAbbrMatchFuzzy    = {fg = "#82AAFF", bg = "NONE", bold = true},
		CmpItemMenu              = {fg = colors.comments},

		CmpItemKindField         = {fg = colors.fg},
		CmpItemKindProperty      = {fg = colors.fg},
		CmpItemKindEvent         = {fg = colors.fg},

		CmpItemKindText          = {fg = colors.fg},
		CmpItemKindEnum          = {fg = colors.fg},
		CmpItemKindKeyword       = {fg = colors.fg},

		CmpItemKindConstant      = {fg = colors.fg},
		CmpItemKindConstructor   = {fg = colors.fg},
		CmpItemKindReference     = {fg = colors.fg},

		CmpItemKindFunction      = {fg = colors.fg},
		CmpItemKindStruct        = {fg = colors.fg},
		CmpItemKindClass         = {fg = colors.fg},
		CmpItemKindModule        = {fg = colors.fg},
		CmpItemKindOperator      = {fg = colors.fg},

		CmpItemKindVariable      = {fg = colors.fg},
		CmpItemKindFile          = {fg = colors.fg},

		CmpItemKindUnit          = {fg = colors.fg},
		CmpItemKindSnippet       = {fg = colors.fg},
		CmpItemKindFolder        = {fg = colors.fg},

		CmpItemKindMethod        = {fg = colors.fg},
		CmpItemKindValue         = {fg = colors.fg},
		CmpItemKindEnumMember    = {fg = colors.fg},

		CmpItemKindInterface     = {fg = colors.fg},
		CmpItemKindColor         = {fg = colors.fg},
		CmpItemKindTypeParameter = {fg = colors.fg},

		-- Dashboard
		DashboardShortCut = {fg = colors.red},
		DashboardHeader   = {fg = colors.comments},
		DashboardCenter   = {fg = colors.accent},
		DashboardFooter   = {fg = colors.green, italic = true},

		-- json
		jsonKeyword          = {fg = colors.fg, bold = false},

		-- diff
		diffRemoved   = {link = "DiffDelete"},
		diffAdded     = {link = "DiffAdd"},
	}

	return syntax
end


theme.loadTreeSitter = function ()
	-- TreeSitter highlight groups
	local treesitter = {
		-- Misc
		TSComment            = {link = "Comment"}, -- For comment blocks.
		-- TSdebug
		TSDefine             = {fg = colors.gray}, -- For syntax/parser errors.
		TSError              = {fg = colors.error}, -- For syntax/parser errors.
		TSNone               = {fg = colors.fg},
		TSPreProc            = {fg = colors.gray}, -- Preprocessor #if, #else, #endif, etc.
		TSPunctDelimiter     = {fg = colors.fg}, -- For delimiters ie: `.`
		TSPunctBracket       = {fg = colors.fg}, -- For brackets and parens.
		TSPunctSpecial       = {fg = colors.fg}, -- For special punctutation that does not fall in the catagories before.

		-- Constants
		TSConstant           = {link = "Constant"}, -- For constants
		TSConstBuiltin       = {fg = colors.fg}, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro         = {fg = colors.pink1}, -- For constants that are defined by macros: `NULL` in C.
		-- TSString             = {fg = colors.green}, -- For strings.
		TSStringRegex        = {fg = colors.yellow}, -- For regexes.
		TSStringEscape       = {fg = colors.green}, -- For escape characters within a string.
		TSStringSpecial      = {fg = colors.cyan}, -- Strings with special meaning that don't fit into the previous categories.

		TSCharacter          = {fg = colors.green}, -- For characters.

		-- TSCharacterSpecial
		-- TSNumber             = {fg = colors.orange}, -- For all numbers
		TSBoolean            = {link = "Boolean"}, -- For booleans.
		-- TSFloat              = {fg = colors.orange}, -- For floats.

		-- Functions
		TSFunction           = {link = "Function"}, -- For fuction (calls and definitions).
		TSFuncBuiltin        = {link = "Function"}, -- For builtin functions: `table.insert` in Lua.
		-- TSFunctionCall
		TSFuncMacro          = {link = "Function"}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSParameter          = {fg = colors.fg}, -- For parameters of a function.

		TSMethod             = {link = "Function"}, -- For method calls and definitions.
		-- TSMethodCall
		TSField              = {fg = colors.fg}, -- For fields.
		TSProperty           = {fg = colors.fg}, -- Same as `TSField`,accesing for struct members in C.

		TSConstructor        = {fg = colors.fg}, -- For constructor calls and definitions: `= {}` in Lua, and Java constructors.

		-- Keywords
		-- TSConditional        = {fg = colors.yellow, bold = true}, -- For keywords related to conditionnals.
		-- TSRepeat             = {fg = colors.yellow, bold = true}, -- For keywords related to loops.
		-- TSLabel              = {link = "Label"}, -- For labels: `label:` in C and `:label:` in Lua.
		-- TSKeyword            = {fg = colors.yellow, bold = true}, -- For keywords that don't fall in previous categories.
		TSKeywordFunction    = {fg = colors.yellow, bold = true}, -- For keywords used to define a fuction.
		TSKeywordOperator    = {fg = colors.yellow, bold = true}, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
		TSKeywordReturn      = {fg = colors.yellow, bold = true}, -- return keyword
		-- TSOperator           = {fg = colors.fg}, -- For any operator: `+`, but also `->` and `*` in C.
		TSException          = {link = "Exception"}, -- For exception related keywords.
		-- TSInclude            = {fg = colors.yellow, bold = true}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSStorageClass       = {fg = colors.pink1, bold = true}, -- Keywords that affect how a variable is stored: static, comptime, extern, etc

		--TSType               = {fg = colors.yellow, bold = true}, -- For types.
		TSTypeBuiltin        = {fg = colors.yellow, bold = true}, -- For builtin types.
		-- TSTypeDefinition
		-- TSTypeQualifier
		TSNamespace          = {fg = colors.yellow}, -- For identifiers referring to modules and namespaces.
		TSSymbol             = {fg = colors.yellow}, -- For identifiers referring to symbols or atoms.
		TSAttribute          = {fg = colors.yellow}, -- (unstable) TODO: docs

		-- Variables
		TSVariable           = {link = "Identifier"}, -- Any variable name that does not have another highlight.
		TSVariableBuiltin    = {link = "Identifier"}, -- Variable names that are defined by the languages, like `this` or `self`.

		-- Text
		TSText               = {fg = colors.fg}, -- For strings considered text in a markup language.
		TSStrong             = {fg = colors.paleblue, bold = true}, -- Text to be represented in bold.
		TSEmphasis           = {fg = colors.paleblue}, -- For text to be represented with emphasis.
		TSUnderline          = {fg = colors.fg, underline = true}, -- For text to be represented with an underline.
		-- TSStrike          = {fg = colors.fg,, strikethrough = true}, -- For strikethrough text.
		TSTitle              = {fg = colors.title, bold = true}, -- Text that is part of a title.
		TSLiteral            = {fg = colors.fg}, -- Literal text.
		TSURI                = {fg = colors.link, bold = true}, -- Any URI like a link or email.
		TSMath               = {fg = colors.blue}, -- Math environments like LaTeX's `$ ... $`
		-- TSEnvironment
		-- TSEnvironmentName
		TSTextReference      = {fg = colors.yellow},

		-- TSNote
		-- TSWarning
		TSDanger             = {fg = colors.error}, -- Text representation of a danger note.
		-- TSTodo

		-- Tags
		TSTag                = {fg = colors.pink1}, -- Tags like html tag names.
		TSTagDelimiter       = {fg = colors.fg}, -- Tag delimiter like `<` `>` `/`
		TSTagAttribute       = {fg = colors.fg}, -- HTML tag attributes.

		TSParameterReference = {fg = colors.paleblue}, -- For references to parameters of a function.


		jsonTSLabel          = {fg = colors.fg, bold = false},
	}

	return treesitter
end

theme.loadLSP = function ()
	-- Lsp highlight groups
	local lsp = {
		-- Nvim 0.6. and up
		DiagnosticError            = {fg = colors.error},
		DiagnosticVirtualTextError = {fg = colors.error},
		DiagnosticFloatingError    = {fg = colors.error},
		DiagnosticSignError        = {fg = colors.error, bg = colors.bg_sign},
		DiagnosticUnderlineError   = {undercurl = true, sp = colors.error},
		DiagnosticWarn             = {fg = colors.yellow},
		DiagnosticVirtualTextWarn  = {fg = colors.yellow},
		DiagnosticFloatingWarn     = {fg = colors.yellow},
		DiagnosticSignWarn         = {fg = colors.yellow, bg = colors.bg_sign},
		DiagnosticUnderlineWarn    = {undercurl = true, sp = colors.yellow},
		DiagnosticInformation      = {fg = colors.paleblue},
		DiagnosticVirtualTextInfo  = {fg = colors.paleblue},
		DiagnosticFloatingInfo     = {fg = colors.paleblue},
		DiagnosticSignInfo         = {fg = colors.paleblue, bg = colors.bg_sign},
		DiagnosticUnderlineInfo    = {undercurl = true, sp = colors.paleblue},
		DiagnosticHint             = {fg = colors.purple},
		DiagnosticVirtualTextHint  = {fg = colors.purple},
		DiagnosticFloatingHint     = {fg = colors.purple},
		DiagnosticSignHint         = {fg = colors.purple, bg = colors.bg_sign},
		DiagnosticUnderlineHint    = {undercurl = true, sp = colors.purple},
		LspReferenceText           = {bg = colors.selection, underline = true}, -- used for highlighting "text" references
		LspReferenceRead           = {link = "LspReferenceText"}, -- used for highlighting "read" references
		LspReferenceWrite          = {link = "LspReferenceText"}, -- used for highlighting "write" references
	}

	return lsp
end

return theme
