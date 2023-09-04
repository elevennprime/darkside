local M = {}

function M.get(palette, config)
	return {
		["@lsp.type.class"]         = {link = "Structure"},
		["@lsp.type.decorator"]     = {link = "Function"},
		["@lsp.type.enum"]          = {link = "Structure"},
		["@lsp.type.enumMember"]    = {link = "Constant"},
		["@lsp.type.function"]      = {link = "Function"},
		["@lsp.type.interface"]     = {link = "Structure"},
		["@lsp.type.macro"]         = {link = "Macro"},
		["@lsp.type.method"]        = {link = "Function"},
		["@lsp.type.namespace"]     = {link = "@namespace"},
		["@lsp.type.parameter"]     = {link = "Identifier"},
		["@lsp.type.property"]      = {link = "Identifier"},
		["@lsp.type.struct"]        = {link = "Structure"},
		["@lsp.type.type"]          = {link = "Type"},
		["@lsp.type.typeParameter"] = {link = "TypeDef"},
		["@lsp.type.variable"]      = {link = "Identifier"},
	}
end

return M
