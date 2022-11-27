-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

-- Load nvim color scheme:
-- Change the "require" values with your color scheme
-- Available color schemes: onedark, monokai, rose-pine
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
    return
end

-- Note: The instruction to load the color scheme may vary.
-- See the README of the selected color scheme for the instruction
-- to use.
-- e.g.: require('color_scheme').setup{}, vim.cmd('color_scheme')

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
color_scheme.setup({
    style = 'dark'
})
color_scheme.load()
