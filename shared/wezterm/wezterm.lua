
local wezterm = require 'wezterm';

return {
  color_scheme = "Gruvbox Dark",
  hide_tab_bar_if_only_one_tab = true,
  keys = {
    -- Turn off the default CMD-m Hide action on macOS by making it
    -- send the empty string instead of hiding the window
        {key="Enter", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},

        {key="h", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="l", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="j", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="k", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Up"}},

         {key="\"", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={ }}},

        {key="%", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}}
  },


  use_ime = true
}
