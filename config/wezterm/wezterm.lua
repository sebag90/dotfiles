-- ~/.wezterm.lua
local wezterm = require 'wezterm'
local config = {}

-- Behaviour
config.window_close_confirmation = 'NeverPrompt'

-- Font
config.font = wezterm.font_with_fallback {
  'CaskaydiaCove Nerd Font',
  'Symbols Nerd Font',
}
config.font_size = 15.0
config.line_height = 1.1
config.warn_about_missing_glyphs = true

-- Color scheme
config.color_scheme = 'rose-pine'
config.colors = {
  selection_fg = '#191724', -- dark text
  selection_bg = '#ebbcba', -- rose-pine accent (nice and visible)
}

-- Window appearance
config.window_background_opacity = 0.96
config.macos_window_background_blur = 20


-- Padding (Gives the text room to breathe)
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 10,
}

-- Cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 600

-- Tab bar (kept subtle)
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

-- Slightly softer rendering
config.bold_brightens_ansi_colors = false

return config
