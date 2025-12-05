local M = {}

function M.get(palette, config)
	return {
		GitSignsAdd = { fg = palette.green }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = palette.yellow }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = palette.red }, -- diff mode: Deleted line |diff.txt|

		GitSignsCurrentLineBlame = { fg = palette.surface1 },

		GitSignsAddPreview = { link = "DiffAdd" },
		GitSignsDeletePreview = { link = "DiffDelete" },

		GitSignsAddInline = { bg = palette.green },
		GitSignsChangeInline = { bg = palette.blue },
		GitSignsDeleteInline = { bg = palette.red },
	}
end

return M
