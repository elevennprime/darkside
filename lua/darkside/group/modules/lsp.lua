local M = {}

function M.get(palette, config)
	return {
		LspReferenceText  = {bg = palette.selection, underline = true}, -- used for highlighting "text" references
		LspReferenceRead  = {link = "LspReferenceText"}, -- used for highlighting "read" references
		LspReferenceWrite = {link = "LspReferenceText"}, -- used for highlighting "write" references
	}
end

return M
