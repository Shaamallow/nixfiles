-- Catppuccin Frappe -- mirrors kitty/frappe.conf

return {
  -- The basic colors
  foreground = "#c6d0f5",
  background = "#303446",
  selection_fg = "#303446",
  selection_bg = "#f2d5cf",

  -- Cursor colors
  cursor_bg = "#f2d5cf",
  cursor_fg = "#303446",
  cursor_border = "#f2d5cf",

  -- Pane split borders (kitty's *_border_color)
  split = "#737994",

  -- The 16 terminal colors
  -- black, red, green, yellow, blue, magenta, cyan, white
  ansi = {
    "#51576d",
    "#e78284",
    "#a6d189",
    "#e5c890",
    "#8caaee",
    "#f4b8e4",
    "#81c8be",
    "#b5bfe2",
  },
  brights = {
    "#626880",
    "#e78284",
    "#a6d189",
    "#e5c890",
    "#8caaee",
    "#f4b8e4",
    "#81c8be",
    "#a5adce",
  },

  -- Tab bar colors
  tab_bar = {
    background = "#232634",
    active_tab = {
      bg_color = "#ca9ee6",
      fg_color = "#232634",
    },
    inactive_tab = {
      bg_color = "#292c3c",
      fg_color = "#c6d0f5",
    },
    inactive_tab_hover = {
      bg_color = "#51576d",
      fg_color = "#c6d0f5",
    },
    new_tab = {
      bg_color = "#232634",
      fg_color = "#c6d0f5",
    },
    new_tab_hover = {
      bg_color = "#51576d",
      fg_color = "#c6d0f5",
    },
  },
}
