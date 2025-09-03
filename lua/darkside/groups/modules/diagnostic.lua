local M = {}

function M.get(palette)
	return {
		DiagnosticError            = {fg = palette.error},
		DiagnosticWarn             = {fg = palette.yellow},
		DiagnosticInformation      = {fg = palette.paleblue},
		DiagnosticHint             = {fg = palette.purple},

		DiagnosticOk               = {},

		DiagnosticVirtualTextError = {fg = palette.error},
		DiagnosticVirtualTextWarn  = {fg = palette.yellow},
		DiagnosticVirtualTextInfo  = {fg = palette.paleblue},
		DiagnosticVirtualTextHint  = {fg = palette.purple},
		DiagnosticVirtualTextOk    = {},

		DiagnosticUnderlineError   = {undercurl = true, sp = palette.error},
		DiagnosticUnderlineWarn    = {undercurl = true, sp = palette.yellow},
		DiagnosticUnderlineInfo    = {undercurl = true, sp = palette.paleblue},
		DiagnosticUnderlineHint    = {undercurl = true, sp = palette.purple},
		DiagnosticUnderlineOk      = {},

		DiagnosticFloatingError    = {fg = palette.error},
		DiagnosticFloatingWarn     = {fg = palette.yellow},
		DiagnosticFloatingInfo     = {fg = palette.paleblue},
		DiagnosticFloatingHint     = {fg = palette.purple},
		DiagnosticFloatingOk       = {},


		-- Used for "Error" signs in sign column.
		DiagnosticSignError        = {},
		DiagnosticSignWarn         = {},
		DiagnosticSignInfo         = {},
		DiagnosticSignHint         = {},
		DiagnosticSignOk           = {},

		-- Used for deprecated or obsolete code.
		DiagnosticDeprecated = {},

		-- Used for unnecessary or unused code.
		DiagnosticUnnecessary = {link = "Comment"},

	}
end

return M
