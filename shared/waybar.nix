{ pkgs, lib, nixpkgs, ... }:
{
  programs.waybar = {

    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 24;

      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-right = [ "pulseaudio" "network" "battery" "clock" "tray" ];
    }];

    style=''
      /* // Dark Background */
/* $gb-dm-bg0: #282828; */
/* $gb-dm-bg0-hard: #1d2021; */
/* $gb-dm-bg0-soft: #32302f; */
/* $gb-dm-bg1: #3c3836; */
/* $gb-dm-bg2: #504945; */
/* $gb-dm-bg3: #665c54; */
/* $gb-dm-bg4: #7c6f64; */

/* // Dark Foreground */
/* $gb-dm-fg0: #fbf1c7; */
/* $gb-dm-fg1: #ebdbb2; */
/* $gb-dm-fg2: #d5c4a1; */
/* $gb-dm-fg3: #bdae93; */
/* $gb-dm-fg4: #a89984; */

/* // Dark Colors */
/* $gb-dm-dark-red: #cc241d; */
/* $gb-dm-dark-green: #98971a; */
/* $gb-dm-dark-yellow: #d79921; */
/* $gb-dm-dark-blue: #458588; */
/* $gb-dm-dark-purple: #b16286; */
/* $gb-dm-dark-aqua: #689d6a; */
/* $gb-dm-dark-orange: #d65d0e; */
/* $gb-dm-dark-gray: #928374; */

/* $gb-dm-light-red: #fb4934; */
/* $gb-dm-light-green: #b8bb26; */
/* $gb-dm-light-yellow: #fabd2f; */
/* $gb-dm-light-blue: #83a598; */
/* $gb-dm-light-purple: #d3869b; */
/* $gb-dm-light-aqua: #8ec07c; */
/* $gb-dm-light-orange: #f38019; */
/* $gb-dm-light-gray: #a89984; */

* {
  border: none;
  border-radius: 0;
  font-family: "SF Mono", "Material Icons", monospace;
  font-size: 12px;
  min-height: 0;
}

window#waybar {
  background: #1d2021;
  color: #fbf1c7;
}

#workspaces button {
  padding: 0 4px;
  background: transparent;
  color: #fbf1c7;
  border-bottom: 2px solid transparent;
}

#workspaces button.focused {
  background: #181818;
  border-bottom: 2px solid #d3869b;
}

#window,
#clock,
#battery,
#cpu,
#memory,
#temperature,
#backlight,
#network,
#pulseaudio,
#tray,
#mode,
#idle_inhibitor,
#language,
#custom-arch,
#custom-disturb_on,
#custom-disturb_off,
#custom-mic,
#mpd {
  padding: 0 8px;
  margin: 0;
}

#window {
  border-left: 2px solid #b16286;
}

#clock {
  background-color: #282828;
}

#network {
  border-bottom: 2px solid #b16286;
}

#pulseaudio {
  border-bottom: 2px solid #83a598;
}

#idle_inhibitor {
  border-bottom: 2px solid #cc241d;
}

#idle_inhibitor.activated {
  background-color: #fb4934;
  color: white;
}

#language {
  border-bottom: 2px solid #8ec07c;
}

#custom-disturb-on,
#custom-disturb-off,
#custom-arch {
  color: white;
  background: #e91e63;
}

#custom-mic {
  border-bottom: 2px solid transparent;
}

#custom-mic.not-muted {
  color: #b8bb26;
  border-bottom-color: #b8bb26;
}

#custom-mic.muted {
  /* color: #fb4934; */
  border-bottom-color: #fb4934;
  color: #fbf1c7;
  background-color: #fb4934;
}

@keyframes blink {
  to {
    background-color: #26a65b;
    color: #fb4934;
  }
}

#battery {
  background-color: #98971a;
  color: #1d2021;
}

#battery.full {
  background-color: transparent;
  color: #b8bb26;
}

#battery.discharging {
  color: #1d2021;
  background-color: #d79921;
}

#battery.charging {
  background-color: #98971a;
  color: #1d2021;
}

#battery.warning:not(.charging) {
  background: #cc241d;
  color: #26a65b;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
'';

};

}
