-- vim:fileencoding=utf-8:foldmethod=marker
-- Mirrors the look of dotfiles/kitty/kitty.conf

local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Fonts

config.font = wezterm.font_with_fallback({
  "FiraCode Nerd Font",
  "Apple Color Emoji",
})
config.font_size = 15.0

-- Random options

config.scrollback_lines = 50000

-- Window Options

-- macos_hide_titlebar yes
config.window_decorations = "RESIZE"
-- confirm_os_window_close 0
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false

-- window_margin_width 1 8 5 (top / right+left / bottom)
config.window_padding = {
  top = 1,
  right = 8,
  bottom = 5,
  left = 8,
}

-- draw_minimal_borders yes -- no dimming of the inactive pane
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }

-- Kitty-style flat tab bar, hidden until there is more than one tab
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.tab_max_width = 32

-- Cursor: blinking block, no fade animation
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Sound Config

config.audible_bell = "Disabled"
config.visual_bell = {
  fade_in_duration_ms = 0,
  fade_out_duration_ms = 0,
}

-- Keyboard shortcuts
-- The word-wise editing binds, matching kitty's send_text, plus kitty's
-- set_tab_title. Everything else is left to WezTerm defaults and tmux.

config.keys = {
  { key = "Backspace", mods = "CTRL", action = act.SendString("\x17") },

  -- WezTerm binds SHIFT+PageUp/PageDown to its own scrollback by default, so the
  -- keys never reach the app. Kitty leaves them free (it uses CTRL+SHIFT), so
  -- release them here and let them be encoded to the PTY.
  { key = "PageUp", mods = "SHIFT", action = act.DisableDefaultAssignment },
  { key = "PageDown", mods = "SHIFT", action = act.DisableDefaultAssignment },

  { key = "LeftArrow", mods = "ALT", action = act.SendString("\x1b\x62") },
  { key = "RightArrow", mods = "ALT", action = act.SendString("\x1b\x66") },

  -- map ctrl+shift+i set_tab_title
  {
    key = "i",
    mods = "CTRL|SHIFT",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
}

-- Colors

config.colors = require("mocha")

-- background_opacity 0.8
config.window_background_opacity = 1.0
config.macos_window_background_blur = 32

return config
