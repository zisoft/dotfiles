local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
  -- set startup Window position
  wezterm.mux.spawn_window(cmd or { position = { x = 1400, y = 200 } })
end)

-- wezterm config
local config = wezterm.config_builder()

config.term = "wezterm"

config.initial_rows = 50
config.initial_cols = 130

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13

-- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.color_scheme = "Catppuccin Frappe"

config.send_composed_key_when_left_alt_is_pressed = true

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },

  { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
  { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
}

return config
