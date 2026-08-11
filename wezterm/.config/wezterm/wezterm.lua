local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- --- WAYLAND / MANGO WM ---
config.prefer_egl = true
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "NONE" -- tiling WM, no decorations needed

-- --- APPEARANCE ---
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('FiraCode Nerd Font Mono')
config.font_size = 11.0
config.window_background_opacity = 0.9
config.window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
}

-- --- BEHAVIOR ---
config.hide_tab_bar_if_only_one_tab = false
config.scrollback_lines = 5000

-- --- KEYBINDINGS ---
config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }

wezterm.on('update-status', function(window, pane)
    local elements = {}
    if window:leader_is_active() then
        table.insert(elements, { Background = { Color = '#ff5555' } })
        table.insert(elements, { Foreground = { Color = '#7aa2f7' } })
        table.insert(elements, { Text = '  ⚡ LEADER  ' })
    end
    local time = wezterm.strftime ' %H:%M '
    table.insert(elements, { Background = { Color = 'rgba(0,0,0,0)' } })
    table.insert(elements, { Foreground = { Color = '#2ac3de' } })
    table.insert(elements, { Text = time })
    window:set_right_status(wezterm.format(elements))
end)

config.tab_max_width = 32
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = pane.current_working_dir
    if title then
        title = title.file_path
        -- shorten home directory to ~
        title = title:gsub(os.getenv('HOME'), '~')
    else
        title = pane.title
    end
    return ' ' .. title .. '   '
end)

config.colors = {
    tab_bar = {
        background = '#1a1b26',
        active_tab = {
            bg_color = '#9d7cd8',  -- add this
            fg_color = '#c0caf5',
        },
        inactive_tab = {
            bg_color = '#16161e',  -- add this
            fg_color = '#565f89',
        },
        inactive_tab_hover = {
            bg_color = '#1a1b26',
            fg_color = '#2ac3de',
        },
        new_tab = {
            bg_color = '#1a1b26',
            fg_color = '#565f89',
        },
        new_tab_hover = {
            bg_color = '#1a1b26',
            fg_color = '#2ac3de',
        },
    },
}

config.keys = {
    { key = 'r', mods = 'LEADER', action = wezterm.action.ReloadConfiguration },
    { key = 'v', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 's', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
}

config.background = {
  {
    source = {
      File = wezterm.home_dir .. '/dotfiles/assets/backgrounds/lineShaders.jpg',
    },
    hsb = {
      brightness = 0.05,
      saturation = 1.0,
    },
  },
}

-- Make tab bar less intrusive
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false


return config
