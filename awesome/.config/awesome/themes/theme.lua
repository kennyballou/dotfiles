-- vim: filetype=lua:
local awful = require("awful")
local theme_dir = awful.util.getdir("config") .. "/themes"

local dark_grey = "#121212"
local grey = "#444444FF"
local light_grey = "#555555"
local white = "#FFFFFF"
local light_white = "#999999"
local light_black = "#232323"
local red = "#B9214F"
local bright_red = "#FF5C8D"
local yellow = "#FF9800"
local bright_yellow = "#FFFF00"
local black = "#000000"
local bright_black = "#5D5D5D"
local green = "#A6E22E"
local bright_green = "#CDEE69"
local blue = "#3399FF"
local bright_blue = "#9CD9F0"
local magenta = "#8E33FF"
local bright_magenta = "#FBB1F9"
local cyan = "#06A2DC"
local bright_cyan = "77DFD8"
local widget_background = "#303030"
local bright_white = "#F7F7F7"
local transparent = "#00000000"

theme = {}
theme.grey = grey
theme.light_grey = light_grey
theme.white = white
theme.black = black
theme.light_black = light_black
theme.red = red
theme.bright_red = bright_red
theme.yellow = yellow
theme.bright_yellow = bright_yellow
theme.green = green
theme.bright_green = bright_green
theme.blue = blue
theme.bright_blue = bright_blue
theme.magenta = magenta
theme.bright_magenta = bright_magenta
theme.cyan = theme.cyan
theme.bright_cyan = bright_cyan
theme.widget_background = widget_background
theme.transparent = transparent
theme.font          = "sans 8"

theme.bg_normal     = light_black
theme.bg_focus      = red
theme.bg_urgent     = bright_red
theme.bg_minimize   = light_black
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = light_white
theme.fg_focus      = white
theme.fg_urgent     = white
theme.fg_minimize   = black

theme.border_width  = 1
theme.border_normal = light_black
theme.border_focus  = "#999999"
theme.border_marked = theme.bg_normal

theme.tasklist_bg_focus  = light_black
theme.tasklist_fg_foucs  = yellow
theme.titlebar_bg_nomral = light_black
theme.titlebar_bg_focus  = light_black

theme.taglist_squares_sel   = theme_dir.."/taglist/squaref.png"
theme.taglist_squares_unsel = theme_dir.."/taglist/square.png"

theme.menu_submenu_icon = theme_dir.."/submenu.png"
theme.menu_border_width = 3
theme.menu_border_color = theme.bg_normal
theme.menu_height = 14
theme.menu_width  = 100

theme.titlebar_close_button_normal = theme_dir.."/titlebar/close.png"
theme.titlebar_close_button_focus  = theme_dir.."/titlebar/close.png"

theme.titlebar_ontop_button_normal_inactive = theme_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme_dir.."/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme_dir.."/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme_dir.."/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme_dir.."/titlebar/maximized_focus_active.png"

theme.wallpaper = os.getenv("HOME") .. "/Pictures/default-background.jpg"

theme.layout_fairh      = theme_dir.."/layouts/fairh.png"
theme.layout_fairv      = theme_dir.."/layouts/fairv.png"
theme.layout_floating   = theme_dir.."/layouts/floating.png"
theme.layout_magnifier  = theme_dir.."/layouts/magnifier.png"
theme.layout_max        = theme_dir.."/layouts/max.png"
theme.layout_fullscreen = theme_dir.."/layouts/fullscreen.png"
theme.layout_tilebottom = theme_dir.."/layouts/tilebottom.png"
theme.layout_tileleft   = theme_dir.."/layouts/tileleft.png"
theme.layout_tile       = theme_dir.."/layouts/tile.png"
theme.layout_tiletop    = theme_dir.."/layouts/tiletop.png"
theme.layout_spiral     = theme_dir.."/layouts/spiral.png"
theme.layout_dwindle    = theme_dir.."/layouts/dwindle.png"

theme.awesome_icon = theme_dir.."/awesome.png"

theme.icon_theme = nil
theme.blingbling = {
    background_color = transparent,
    graph_background_color = widget_background,
    graph_color = bright_magenta,
    graph_line_color = magenta,
    rounded_size = 0.3,
    text_color = light_white,
    font = "Droid Sans Mono",
    font_size = 9,
}

theme.blingbling.tagslist = {}
theme.blingbling.tagslist.normal = {
    background_color = widget_background,
    text_background_color = transparent,
    rounded_size = {0, 0.4, 0, 0.4,},
    font = "Droid Sans",
    font_size = 7,
}
theme.blingbling.tagslist.focus = {
    h_margin = 1,
    v_margin = 1,
    background_color = red,
    text_background_color = widget_background,
    text_color = theme.fg_normal,
    rounded_size = {0, 0.4, 0, 0.4,},
    font = "Droid Sans italic",
    font_size = 8,
}
theme.blingbling.tagslist.urgent = theme.blingbling.tagslist.focus
theme.blingbling.tagslist.occupied = theme.blingbling.tagslist.normal

return theme
