local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
  -- set startup Window position
  wezterm.mux.spawn_window(cmd or { position = { x = 1400, y = 200 } })
end)

local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'CTRL|META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'CTRL|META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

-- wezterm config
local config = wezterm.config_builder()

config.initial_rows = 50
config.initial_cols = 130
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.color_scheme = "Catppuccin Frappe"

config.send_composed_key_when_left_alt_is_pressed = true

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- make ALT-i available to Neovim
  { key = "i", mods = "ALT",    action = wezterm.action.SendKey { key = "i", mods = "ALT" } },

  { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },

  { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
  { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },

  -- move between split panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),

  -- resize panes
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),
  split_nav('resize', 'l'),
}

return config
