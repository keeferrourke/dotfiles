# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
  colors = true
  color_good = "#2aa198"
  color_degraded = "#b58900"
  color_bad = "#dc322f"
  color_separator = "#839496"
  interval = 5
  output_format = "i3bar"
  separator = " "
}

order += "cpu_usage"
order += "load"
order += "disk /home"
order += "volume master"
order += "wireless _first_"
order += "ethernet _first_"
order += "battery all"
order += "tztime local"


cpu_usage {
  format = "CPU %usage"
}

cpu_temperature 0 {
  format = " %degrees °C"
}

wireless _first_ {
  #format_up = "W: %essid %quality %ip"
  format_up = "  %essid %quality"
  format_down = "  No Wi-Fi"
}

ethernet _first_ {
  # if you use %speed, i3status requires root privileges
  format_up = "  %ip"
  format_down = ""
}

volume master {
  format = "  %volume"
  format_muted = "  muted (%volume)"
  device = "default"
  mixer = "Master"
  mixer_idx = 0
}

battery all {
  format = "%status %percentage (%remaining)"
  hide_seconds = true
  format_down = " "
  status_chr = "⚡"
  status_bat = " "
  status_unk = "?"
  status_full = " "
  #status_full = "💯"
}

tztime local {
  format = "  %Y-%m-%d   %H:%M"
}

load {
  format = "  %1min"
}

disk "/home" {
  format = "  home: %percentage_avail%%"
}
