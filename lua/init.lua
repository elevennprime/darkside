-- Load the theme with user configuration
local setup = function (options)
	require('config').setup(options)
end

return { setup = setup }
