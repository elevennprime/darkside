-- This file is used to define
-- the basic colors of the theme

local config = require('config').options

local colors = {
	-- Dark colors
	darkred       = '#c01c28',
	darkgreen     = '#73c936',
	darkyellow    = '#e9ad0c',
	darkblue      = '#1e5098',
	-- darkorange = '#e2795b',
	error         = '#ff4f58',
	cursor        = '#ffdd33',
	title         = '#eeffff',

	-- Common colors
	black         = '#000000',
	white         = '#ffffff',
	gray          = '#717cb4',
	red           = '#f43841',
	red1          = '#fa2772',
	green         = '#33d17a',
	yellow        = '#ffdd33',
	blue          = '#2a7bde',
	paleblue      = '#b0c9ff',
	cyan          = '#33c7de',
	purple        = '#c061cb',
	orange        = '#f78c6c',
	pink          = '#ff9cac',
	pink1         = '#f92772',

	bg            = '#181818',
	bg_alt        = '#282828',
	fg            = '#e4e4ef',
	fg_alt        = '#9e9e9e',
	selection     = '#464b5d',
	contrast      = '#1e272c',
	active        = '#314549',
	border        = '#37444c',
	line_numbers  = '#37474f',
	highlight     = '#425b67',
	disabled      = '#415967',
	accent        = '#009688',

	none          =  'NONE',
}

colors.string     = colors.green
colors.link       = colors.blue
colors.comments   = '#546E7A'


-- Apply the disabled background setting
if config.disable.background then
	colors.bg = 'NONE'
end

-- Disable borders
if config.disable.borders then
	colors.vsp = colors.bg
else
	colors.vsp = colors.border
	colors.vsp = colors.bg
end

-- Enable contrast sidebars
if config.contrast.sidebars == true then
	colors.sidebar = colors.bg_alt
else
	colors.sidebar = colors.bg
end

-- Enable contrast floating windows
if config.contrast.floating_windows == true then
	colors.float = colors.bg_alt
else
	colors.float = colors.bg
end

-- Enable contrast line numbers
if config.contrast.line_numbers == true then
	colors.bg_num = colors.bg_alt
else
	colors.bg_num = colors.bg
end

-- Enable contrast sign column
if config.contrast.sign_column == true then
	colors.bg_sign = colors.bg_alt
else
	colors.bg_sign = colors.bg
end

-- Enable contrast cursor line
if config.contrast.cursor_line == true then
	colors.bg_cur = colors.bg_alt
else
	colors.bg_cur = colors.active
end

if config.contrast.non_current_windows == true then
	colors.bg_nc = colors.bg_alt
else
	colors.bg_nc = colors.bg
end

return colors
