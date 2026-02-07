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
config.font_size = 14.0
config.line_height = 1.1
config.warn_about_missing_glyphs = true

-- Color scheme
config.color_scheme = 'rose-pine'

-- Window appearance
config.window_background_opacity = 0.96
config.macos_window_background_blur = 20
-- config.window_decorations = "RESIZE"

-- config.window_padding = {
--   left = 5,
--   right = 5,
--   top = 5,
--   bottom = 5,
-- }

-- Tab Bar Styling (Sleek & Integrated)
-- config.use_fancy_tab_bar = true
-- config.enable_tab_bar = false
-- config.window_frame = {
--   font = wezterm.font({ family = 'Cascadia Code', weight = 'Bold' }),
--   font_size = 14.0,
--   active_titlebar_bg = '#191724',
-- }

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

-- Keybindings
config.keys = {}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
