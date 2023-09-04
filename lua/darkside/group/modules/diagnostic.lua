local M = {}

function M.get(palette)
	return {
		DiagnosticError            = {fg = palette.error},
		DiagnosticVirtualTextError = {fg = palette.error},
		DiagnosticFloatingError    = {fg = palette.error},
		DiagnosticSignError        = {fg = palette.error, bg = palette.bg_sign},
		DiagnosticUnderlineError   = {undercurl = true, sp = palette.error},
		DiagnosticWarn             = {fg = palette.yellow},
		DiagnosticVirtualTextWarn  = {fg = palette.yellow},
		DiagnosticFloatingWarn     = {fg = palette.yellow},
		DiagnosticSignWarn         = {fg = palette.yellow, bg = palette.bg_sign},
		DiagnosticUnderlineWarn    = {undercurl = true, sp = palette.yellow},
		DiagnosticInformation      = {fg = palette.paleblue},
		DiagnosticVirtualTextInfo  = {fg = palette.paleblue},
		DiagnosticFloatingInfo     = {fg = palette.paleblue},
		DiagnosticSignInfo         = {fg = palette.paleblue, bg = palette.bg_sign},
		DiagnosticUnderlineInfo    = {undercurl = true, sp = palette.paleblue},
		DiagnosticHint             = {fg = palette.purple},
		DiagnosticVirtualTextHint  = {fg = palette.purple},
		DiagnosticFloatingHint     = {fg = palette.purple},
		DiagnosticSignHint         = {fg = palette.purple, bg = palette.bg_sign},
		DiagnosticUnderlineHint    = {undercurl = true, sp = palette.purple},
	}
end

return M
