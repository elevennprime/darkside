local M = {}


-- See `https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md`
function M.get(palette, config)
	return {
		-- Misc
		["@comment"]               = {link = "Comment"}, -- line and block comments
		["@comment.documentation"] = {link = "@comment"}, -- comments documenting code
		["@error"]                 = {fg = palette.error}, -- syntax/parser errors.
		["@none"]                  = {fg = palette.fg}, -- completely disable the highlight
		["@preproc"]               = {fg = palette.gray}, -- preprocessor #if, #else, #endif, etc.
		["@define"]                = {fg = palette.gray}, -- preprocessor definition directives
		["@operator"]              = {link = "Operator"},  -- symbolic operators (e.g. `+` / `*`)

		-- Punctuation
		["@punctuation"]           = {fg = palette.fg}, -- delimiters
		["@punctuation.delimiter"] = {link = "@punctuation"}, -- delimiters (e.g. `;` / `.` / `,`)
		["@punctuation.bracket"]   = {link = "@punctuation"}, -- brackets (e.g. `()` / `{}` / `[]`)
		["@punctuation.special"]   = {fg = palette.pink1}, -- special symbols (e.g. `{}` in string interpolation)

		-- Literals
		["@string"]                = {fg = palette.green}, -- string literals
		["@string.regex"]          = {fg = palette.yellow}, --  regular expressions
		["@string.documentation"]  = {link = "@string"}, -- string documenting code (e.g. Python docstrings)
		["@string.escape"]         = {fg = palette.green}, -- escape sequences
		["@string.special"]        = {fg = palette.cyan}, -- other special strings (e.g. dates)

		["@character"]             = {fg = palette.green}, -- character literals
		["@character.special"]     = {fg = palette.green}, -- special characters (e.g. wildcards)

		["@boolean"]               = {link = "Boolean"}, -- boolean literals
		["@number"]                = {fg = palette.darkorange}, -- numeric literals
		["@float"]                 = {fg = palette.orange}, -- floating-point number literals

		-- Functions
		["@function"]              = {link = "Function"}, -- function definitions
		["@function.builtin"]      = {link = "@function"}, -- built-in functions
		["@function.call"]         = {link = "@function"}, -- function calls
		["@function.macro"]        = {link = "@function"}, -- preprocessor macros

		["@method"]                = {link = "@function"}, -- method definitions
		["@method.call"]           = {link = "@function"}, -- method calls

		["@constructor"]           = {fg = palette.fg}, -- constructor calls and definitions
		["@parameter"]             = {fg = palette.fg}, -- parameters of a function
		["@parameter.reference"]   = {fg = palette.paleblue}, -- references to parameters of a function.

		-- Keywords
		["@keyword"]               = {fg = palette.yellow, bold = true}, -- various keywords
		["@keyword.coroutine"]     = {link = "@keyword"}, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		["@keyword.function"]      = {link = "@keyword"}, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		["@keyword.operator"]      = {link = "@keyword"}, -- operators that are English words (e.g. `and` / `or`)
		["@keyword.return"]        = {link = "@keyword"}, -- keywords like `return` and `yield`

		["@conditional"]           = {fg = palette.yellow, bold = true}, -- keywords related to conditionals (e.g. `if` / `else`)
		["@conditional.ternary"]   = {link = "@conditional"}, -- ternary operator (e.g. `?` / `:`)

		["@repeat"]                = {fg = palette.yellow, bold = true}, -- keywords related to loops (e.g. `for` / `while`)
		["@debug"]                 = {link = "Debug"}, -- keywords related to debugging
		["@label"]                 = {link = "Label"}, -- GOTO and other labels (e.g. `label:` in C)
		["@include"]               = {link = "Include"}, -- keywords for including modules (e.g. `import` / `from` in Python)
		["@exception"]             = {link = "Exception"}, -- keywords related to exceptions (e.g. `throw` / `catch`)



		-- Types
		["@type"]                  = {link = "Type"}, -- type or class definitions and annotations
		["@type.builtin"]          = {link = "@type"}, -- built-in types
		["@type.definition"]       = {fg = palette.fg}, -- type definitions (e.g. `typedef` in C)
		["@type.qualifier"]        = {fg = palette.yellow, bold = true}, -- type qualifiers (e.g. `const`)

		["@storageclass"]          = {fg = palette.yellow, bold = true}, -- modifiers that affect storage in memory or life-time
		["@attribute"]             = {fg = palette.fg}, -- attribute annotations (e.g. Python decorators)
		["@field"]                 = {fg = palette.fg}, -- object and struct fields
		["@property"]              = {fg = palette.fg}, -- similar to `@field`

		-- identifiers
		["@variable"]              = {link = "Identifier"}, -- various variable names
		["@variable.builtin"]      = {link = "Identifier"}, -- built-in variable names (e.g. `this`)

		["@constant"]              = {link = "Constant"}, -- constant identifiers
		["@constant.builtin"]      = {fg = palette.fg}, -- built-in constant values (e.g. `nil`)
		["@constant.macro"]        = {fg = palette.pink1}, -- constants defined by the preprocessor

		["@namespace"]             = {fg = palette.fg}, -- modules or namespaces
		["@symbol"]                = {fg = palette.fg}, -- symbols or atoms

		-- Text
		["@text"]                  = {fg = palette.fg}, -- non-structured text
		["@text.strong"]           = {bold = true}, -- bold text
		["@text.emphasis"]         = {italic = true}, -- text with emphasis
		["@text.underline"]        = {underline = true}, -- underlined text
		["@text.strike"]           = {strikethrough = true}, -- strike through text
		["@text.title"]            = {fg = palette.title, bold = true}, -- text that is part of a title
		["@text.quote"]            = {link = "@text"}, -- text quotations
		["@text.uri"]              = {fg = palette.link, bold = true}, -- URIs (e.g. hyperlinks)
		["@text.math"]             = {fg = palette.blue}, -- math environments (e.g. `$ ... $` in LaTeX)
		["@text.environment"]      = {fg = palette.yellow, bold = true}, -- text environments of markup languages
		["@text.environment.name"] = {fg = palette.fg}, -- text indicating the type of an environment
		["@text.reference"]        = {fg = palette.fg, underline = true}, -- text references, footnotes, citations, etc.

		["@text.literal"]          = {fg = palette.green}, -- literal or verbatim text (e.g., inline code)
		["@text.literal.block"]    = {link = "@text"}, -- literal or verbatim text as a stand-alone block

		["@text.todo"]             = {link = "Todo"}, -- todo notes
		["@text.note"]             = {link = "@text"}, -- info notes
		["@text.warning"]          = {link = "@text"}, -- warning notes
		["@text.danger"]           = {link = "@text"}, -- danger/error notes

		["@text.diff.add"]         = {link = "DiffAdd"}, -- added text (for diff files)
		["@text.diff.delete"]      = {link = "DiffDelete"}, -- deleted text (for diff files)

		-- Tags
		["@tag"]                   = {fg = palette.pink1}, -- XML tag names
		["@tag.delimiter"]         = {fg = palette.fg}, -- XML tag attributes
		["@tag.attribute"]         = {fg = palette.fg}, -- XML tag delimiters

		-- Conceal
		["@conceal"]               = {fg = palette.fg}, -- for captures that are only used for concealing


		-- Language specific:
		-- latex
		["@namespace.latex"]       = {fg = palette.yellow, bold = true}, -- For identifiers referring to modules and namespaces.
		-- json
		["@label.json"]            = {bold = false},
	}
end

return M
