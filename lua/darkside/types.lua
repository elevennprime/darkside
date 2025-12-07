---@class Darkside
---@field options DarksideOptions
---@field setup fun(opts: DarksideOptions?)
---@field load fun()

---@class DarksideOptions
-- By default darkside writes the compiled results into the system's cache directory.
-- You can change the cache dir by changing this value.
---@field compile_path string
-- Whether to enable transparency.
---@field transparent_background boolean?
---@field float DSFloatOpts?
-- Should default integrations be used.
---@field default_modules boolean?
-- Toggle integrations. Integrations allow Catppuccin to set the theme of various plugins.
---@field modules DSModules?

---@class DSFloatOpts
---@field transparent boolean enable transparent floating windows


---@class DSModules
---@field cmp boolean?
---@field gitsigns boolean?
---@field neogit boolean?


