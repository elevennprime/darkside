local M = {}

function M.get(palette, config)
	return {
		-- Highlight group for unmatched characters of each completion field.
		-- CmpItemAbbr = {fg = palette.fg},
		-- Highlight group for unmatched characters of each deprecated completion field.
		CmpItemAbbrDeprecated = {strikethrough = true},

		-- Highlight group for matched characters of each completion field. Matched characters
		-- must form a substring of a field which share a starting position.
		CmpItemAbbrMatch = {fg = palette.blue3, bold = true},
		-- Highlight group for fuzzy-matched characters of each completion field.
		CmpItemAbbrMatchFuzzy = {link = "CmpItemAbbrMatch"},

		-- The menu field's highlight group.
		CmpItemMenu = {fg = palette.comments},

		--   Highlight group for the kind of the field.
		CmpItemKind = {fg = palette.fg},

		-- CmpItemKind%KIND_NAME%
		-- Highlight groups for the kind of the field for a specific `lsp.CompletionItemKind`.
		-- If you only want to overwrite the `method` kind's highlight group, you can do this:
		-- highlight CmpItemKindMethod guibg=NONE guifg=Orange
		CmpItemKindField = {},
		CmpItemKindProperty = {},
		CmpItemKindEvent = {},

		CmpItemKindText = {},
		CmpItemKindEnum = {},
		CmpItemKindKeyword = {},

		CmpItemKindConstant = {},
		CmpItemKindConstructor = {},
		CmpItemKindReference = {},

		CmpItemKindFunction = {},
		CmpItemKindStruct = {},
		CmpItemKindClass = {},
		CmpItemKindModule = {},
		CmpItemKindOperator = {},

		CmpItemKindVariable = {},
		CmpItemKindFile = {},

		CmpItemKindUnit = {},
		CmpItemKindSnippet = {},
		CmpItemKindFolder = {},

		CmpItemKindMethod = {},
		CmpItemKindValue = {},
		CmpItemKindEnumMember = {},

		CmpItemKindInterface = {},
		CmpItemKindColor = {},
		CmpItemKindTypeParameter = {},
	}
end

return M
