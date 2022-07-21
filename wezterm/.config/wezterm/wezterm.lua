local wezterm = require 'wezterm'
local dracula = require 'dracula'

return {
    font = wezterm.font_with_fallback {
        'Monaco',
        'CodeNewRoman Nerd Font',
        'agave Nerd Font',
    },
    font_size = 12.5,
    -- line_height = 1.1,
    freetype_load_target = 'Light',
    freetype_render_target = 'HorizontalLcd',

    colors = dracula,
    -- tab_bar_at_bottom = true,
    -- use_fancy_tab_bar = false,

    initial_rows = 35,
    initial_cols = 100,
}
