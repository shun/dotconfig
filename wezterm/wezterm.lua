local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'iceberg-dark'

-- フォントの設定
config.font = wezterm.font("SF Mono Square", {weight="Medium", stretch="Normal", style="Normal"})

-- フォントサイズの設定
config.font_size = 20

config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  tab_bar = {
    background = "#161821",
    active_tab = {
      bg_color = "#84a0c6",
      fg_color = "#161821",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1e2132",
      fg_color = "#6b7089",
    },
    inactive_tab_hover = {
      bg_color = "#2a3158",
      fg_color = "#c6c8d1",
    },
    new_tab = {
      bg_color = "#161821",
      fg_color = "#6b7089",
    },
    new_tab_hover = {
      bg_color = "#84a0c6",
      fg_color = "#161821",
    },
},
}

config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.disable_default_key_bindings = true

return config

