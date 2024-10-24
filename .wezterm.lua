-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'Berkeley Mono Variable'
config.font_size = 14.0
config.color_scheme = 'zenbones'

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '[',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = ']',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Right',
  }
}

-- and finally, return the configuration to wezterm
return config
