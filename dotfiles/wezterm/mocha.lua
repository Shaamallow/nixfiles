-- Catppuccin Mocha -- mirrors kitty/mocha.conf

return {
  -- The basic colors
  foreground = "#cdd6f4",
  background = "#1e1e2e",
  selection_fg = "#1e1e2e",
  selection_bg = "#f5e0dc",

  -- Cursor colors
  cursor_bg = "#f5e0dc",
  cursor_fg = "#1e1e2e",
  cursor_border = "#f5e0dc",

  -- Pane split borders (kitty's *_border_color)
  split = "#6c7086",

  -- The 16 terminal colors
  -- black, red, green, yellow, blue, magenta, cyan, white
  ansi = {
    "#45475a",
    "#f38ba8",
    "#a6e3a1",
    "#f9e2af",
    "#89b4fa",
    "#f5c2e7",
    "#94e2d5",
    "#bac2de",
  },
  brights = {
    "#585b70",
    "#f38ba8",
    "#a6e3a1",
    "#f9e2af",
    "#89b4fa",
    "#f5c2e7",
    "#94e2d5",
    "#a6adc8",
  },

  -- Tab bar colors
  tab_bar = {
    background = "#11111b",
    active_tab = {
      bg_color = "#cba6f7",
      fg_color = "#11111b",
    },
    inactive_tab = {
      bg_color = "#181825",
      fg_color = "#cdd6f4",
    },
    inactive_tab_hover = {
      bg_color = "#45475a",
      fg_color = "#cdd6f4",
    },
    new_tab = {
      bg_color = "#11111b",
      fg_color = "#cdd6f4",
    },
    new_tab_hover = {
      bg_color = "#45475a",
      fg_color = "#cdd6f4",
    },
  },
}
