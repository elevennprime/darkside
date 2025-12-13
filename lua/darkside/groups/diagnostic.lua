local M = {}

function M.get(palette)
	return {
		DiagnosticError            = { fg = palette.error },
		DiagnosticWarn             = { fg = palette.yellow },
		DiagnosticInformation      = { fg = palette.paleblue },
		DiagnosticHint             = { fg = palette.purple },

		DiagnosticUnderlineError   = { style = { "undercurl" }, sp = palette.error },
		DiagnosticUnderlineWarn    = { style = { "undercurl" }, sp = palette.yellow },
		DiagnosticUnderlineInfo    = { style = { "undercurl" }, sp = palette.paleblue },
		DiagnosticUnderlineHint    = { style = { "undercurl" }, sp = palette.purple },

		DiagnosticUnnecessary      = { link = "Comment" },
	}
end

return M
