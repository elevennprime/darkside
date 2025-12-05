local M = {}

function M.get(palette, config)
	return {
		NeogitBranch        = { fg = palette.green },
		NeogitBranchHead    = { fg = palette.cyan, bold = true, underline = true },
		NeogitSectionHeader = { link = "Keyword" },
		NeogitRemote        = { fg = palette.red },
		NeogitObjectId      = { fg = palette.line_numbers },
		NeogitTagName       = { link = "Comment" },
	}
end

return M
