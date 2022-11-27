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

    window_background_opacity = 0.98,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    colors = dracula,
    -- enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,

    initial_rows = 35,
    initial_cols = 100,
}
