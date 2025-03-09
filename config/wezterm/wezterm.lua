local wezterm = require("wezterm")
wezterm.on("gui-startup", function(cmd)
	-- set startup Window position
	wezterm.mux.spawn_window(cmd or { position = { x = 1400, y = 200 } })
end)

-- wezterm config
local config = wezterm.config_builder()

config.initial_rows = 50
config.initial_cols = 130
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13

config.color_scheme = "Catppuccin Frappe"

config.send_composed_key_when_left_alt_is_pressed = true

return config
