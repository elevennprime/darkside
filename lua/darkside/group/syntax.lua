local M = {}

function M.get(palette, config)
	return {
		-- Comment: any comment
		Comment             = {fg = palette.comments},

		--[[
			Constant: any constant
			String: any string
			Character: any character constant: 'c', '\n'
			Number: a number constant: 5
			Boolean: a boolean constant: TRUE, false
			Float: a floating point constant: 2.3e10
		]]
		Constant            = {fg = palette.fg},
		String              = {fg = palette.green},
		Character           = {fg = palette.orange},
		Number              = {fg = palette.fg},
		Boolean             = {fg = palette.red1},
		Float               = {fg = palette.fg},

		--[[
			Identifier: any variable name
			Function: italic funtion names
		]]
		Identifier          = {fg = palette.fg, italic = config.italics.variables},
		Function            = {fg = palette.fg},

		--[[
			Statement: any statement
			Conditional: italic if, then, else, endif, switch, etc.
			Repeat: italic any other keyword
			Label: case, default, etc.
			Operator: sizeof", "+", "*", etc.
			Keyword: italic for, do, while, etc.
			Exception: try, catch, throw
		]]
		Statement           = {fg = palette.cyan},
		Conditional         = {fg = palette.yellow, bold = true},
		Repeat              = {fg = palette.yellow, bold = true},
		Label               = {fg = palette.fg, bold = true},
		Operator            = {fg = palette.fg},
		Keyword             = {fg = palette.yellow, bold = true},
		Exception           = {fg = palette.yellow, bold = true},

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
		PreProc             = {fg = palette.gray},
		Include             = {fg = palette.pink1},
		Define              = {fg = palette.gray},
		Macro               = {fg = palette.fg},
		PreCondit           = {fg = palette.gray},
		Type                = {fg = palette.blue1},
		StorageClass        = {fg = palette.cyan},
		Structure           = {fg = palette.blue1},
		Typedef             = {fg = palette.red},

		--[[
			Special: any special symbol
			SpecialChar: special character in a constant
			Tag: you can use CTRL-] on this
			Delimiter: character that needs attention like , or .
			SpecialComment: special things inside a comment
			Debug: debugging statements
		]]
		Special             = {fg = palette.fg},
		SpecialChar         = {fg = palette.disabled},
		Tag                 = {fg = palette.red},
		Delimiter           = {fg = palette.fg},
		SpecialComment      = {link = "Comment"},
		Debug               = {fg = palette.red},

		-- Underlined: text that stands out, HTML links
		Underlined          = {fg = palette.link, underline = true},

		-- Ignore: left blank, hidden
		Ignore              = {fg = palette.disabled},

		-- Error: any erroneous construct
		Error               = {fg = palette.error, bold = true, underline = true},

		-- Todo: anything that needs extra attention; mostly the keywords TODO HACK FIXME and XXX
		Todo                = {fg = palette.orange, bold = true},

		-- Extra highlights
		htmlLink            = {fg = palette.link, underline = true},
		htmlTagName         = {fg = palette.pink1},

		htmlArg             = {fg = palette.fg},
		htmlH1              = {fg = palette.cyan, bold = true},
		htmlH2              = {fg = palette.red, bold = true},
		htmlH3              = {fg = palette.green, bold = true},
		htmlH4              = {fg = palette.yellow, bold = true},
		htmlH5              = {fg = palette.purple, bold = true},

		xmlTagName          = {link = "htmlTagName"},
		xmlTagN             = {link = "xmlTagName"},
		xmlAttrib           = {link = "htmlArg"},

		markdownH1          = {fg = palette.cyan, bold = true},
		markdownH2          = {fg = palette.red, bold = true},
		markdownH3          = {fg = palette.green, bold = true},
		markdownH1Delimiter = {fg = palette.cyan},
		markdownH2Delimiter = {fg = palette.red},
		markdownH3Delimiter = {fg = palette.green},

		healthError         = {fg = palette.error},
		healthSuccess       = {fg = palette.green},
		healthWarning       = {fg = palette.yellow},

		-- nvim cmp
		PmenuSel            = {fg = "NONE", bg = "#282C34"},
		Pmenu               = {fg = palette.fg, bg = "#22252A"},

		CmpItemAbbrDeprecated    = {fg = "#7E8294", bg = "NONE"},
		CmpItemAbbrMatch         = {fg = "#82AAFF", bg = "NONE", bold = true},
		CmpItemAbbrMatchFuzzy    = {fg = "#82AAFF", bg = "NONE", bold = true},
		CmpItemMenu              = {fg = palette.comments},

		CmpItemKindField         = {fg = palette.fg},
		CmpItemKindProperty      = {fg = palette.fg},
		CmpItemKindEvent         = {fg = palette.fg},

		CmpItemKindText          = {fg = palette.fg},
		CmpItemKindEnum          = {fg = palette.fg},
		CmpItemKindKeyword       = {fg = palette.fg},

		CmpItemKindConstant      = {fg = palette.fg},
		CmpItemKindConstructor   = {fg = palette.fg},
		CmpItemKindReference     = {fg = palette.fg},

		CmpItemKindFunction      = {fg = palette.fg},
		CmpItemKindStruct        = {fg = palette.fg},
		CmpItemKindClass         = {fg = palette.fg},
		CmpItemKindModule        = {fg = palette.fg},
		CmpItemKindOperator      = {fg = palette.fg},

		CmpItemKindVariable      = {fg = palette.fg},
		CmpItemKindFile          = {fg = palette.fg},

		CmpItemKindUnit          = {fg = palette.fg},
		CmpItemKindSnippet       = {fg = palette.fg},
		CmpItemKindFolder        = {fg = palette.fg},

		CmpItemKindMethod        = {fg = palette.fg},
		CmpItemKindValue         = {fg = palette.fg},
		CmpItemKindEnumMember    = {fg = palette.fg},

		CmpItemKindInterface     = {fg = palette.fg},
		CmpItemKindColor         = {fg = palette.fg},
		CmpItemKindTypeParameter = {fg = palette.fg},

		-- Dashboard
		DashboardShortCut = {fg = palette.red},
		DashboardHeader   = {fg = palette.comments},
		DashboardCenter   = {fg = palette.accent},
		DashboardFooter   = {fg = palette.green, italic = true},

		-- json
		jsonKeyword          = {fg = palette.fg, bold = false},

		-- diff
		diffRemoved   = {link = "DiffDelete"},
		diffAdded     = {link = "DiffAdd"},
	}
end

return M
