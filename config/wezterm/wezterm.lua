local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
  -- set startup Window position
  wezterm.mux.spawn_window(cmd or { position = { x = 1300, y = 200 } })
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
config.font_size = 12

-- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.color_scheme = "Catppuccin Frappe"

config.send_composed_key_when_left_alt_is_pressed = true

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }


local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

-- local direction_keys = {
--   h = 'Left',
--   j = 'Down',
--   k = 'Up',
--   l = 'Right',
-- }
--
-- local function split_nav(resize_or_move, key)
--   return {
--     key = key,
--     mods = resize_or_move == 'resize' and 'META|CTRL' or 'CTRL',
--     action = wezterm.action_callback(function(win, pane)
--       if is_vim(pane) then
--         -- pass the keys through to vim/nvim
--         win:perform_action({
--           SendKey = { key = key, mods = resize_or_move == 'resize' and 'META|CTRL' or 'CTRL' },
--         }, pane)
--       else
--         if resize_or_move == 'resize' then
--           win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
--         else
--           win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
--         end
--       end
--     end),
--   }
-- end
--
-- config.keys = {
--   { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
--   { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
--
--   { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
--   { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
--   { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
--
--   {
--     key = ',',
--     mods = 'LEADER',
--     action = wezterm.action.PromptInputLine {
--       description = 'Enter new name for tab',
--       action = wezterm.action_callback(
--         function(window, _, line)
--           if line then
--             window:active_tab():set_title(line)
--           end
--         end
--       ),
--     },
--   },
--
--   -- move between split panes
--   split_nav('move', 'h'),
--   split_nav('move', 'j'),
--   split_nav('move', 'k'),
--   split_nav('move', 'l'),
--
--   -- resize panes
--   split_nav('resize', 'h'),
--   split_nav('resize', 'j'),
--   split_nav('resize', 'k'),
--   split_nav('resize', 'l'),
-- }

return config
