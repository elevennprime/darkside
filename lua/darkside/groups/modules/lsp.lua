local M = {}

function M.get(palette, config)
	return {
		LspReferenceText  = {bg = palette.selection, underline = true}, -- used for highlighting "text" references
		LspReferenceRead  = {link = "LspReferenceText"}, -- used for highlighting "read" references
		LspReferenceWrite = {link = "LspReferenceText"}, -- used for highlighting "write" references
		-- Used to color the virtual text of the codelens. See
		LspCodeLens = {},
		-- Used to color the separator between two or more code lenses.
		LspCodeLensSeparator = {},
		-- Used to highlight the active parameter in the signature help. See vim.lsp.handlers.signature_help()
		LspSignatureActiveParameter = {fg = palette.fg, bold = true},
	}
end

return M
