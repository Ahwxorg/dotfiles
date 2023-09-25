local wezterm = require("wezterm")
local action = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_decorations = "RESIZE"
config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font_with_fallback({
  {
    family = 'ComicShannsMono Nerd Font Mono',
    weight = "Bold"
  },
  {
    family = "ComicShannsMono Nerd Font Mono",
    weight = "Bold"
  }
})

config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
config.window_background_opacity = 0.8
config.send_composed_key_when_left_alt_is_pressed = true
config.font_size = 15.0
config.cell_width = 0.88888888887 -- 8 / 9 rounded down
config.front_end = "WebGpu"
config.animation_fps = 1

config.leader = { key = 'Space', mods = 'SHIFT|CTRL' }
return config
