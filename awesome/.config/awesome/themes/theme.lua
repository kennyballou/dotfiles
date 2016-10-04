-- vim: filetype=lua:
local awful = require("awful")
local config_dir = awful.util.getdir("config")
local theme_dir = config_dir .. "/themes"
local lain_icons = config_dir .. "/lain/icons"

local bg_default = "#3F3F3F"
local fg_default = "#EFEFEF"
local fg_focus = "#F0DFAF"
local dark_grey = "#121212"
local grey = "#444444FF"
local light_grey = "#555555"
local white = "#FFFFFF"
local light_white = "#999999"
local light_black = "#232323"
local red = "#DCA3A3"
local yellow = "#EFEF8F"
local black = "#000000"
local green = "#7F9F7F"
local blue = "#8CD0D3"
local transparent = "#00000000"

theme = {}
theme.confdir = config_dir

--{{Colors!
theme.dark_grey = dark_grey
theme.grey = grey
theme.light_grey = light_grey
theme.white = white
theme.light_white = light_white
theme.light_black = light_black
theme.red = red
theme.yellow = yellow
theme.black = black
theme.green = green
theme.blue = blue
theme.transparent = transparent
--}}

theme.font          = "sans 8"
theme.fg_normal = "#DCDCCC"
theme.fg_default = fg_default
theme.fg_focus = "#F0DFAF"

theme.bg_normal     = bg_default
theme.bg_focus      = light_black
theme.bg_urgent     = green
theme.bg_minimize   = light_black
theme.bg_systray    = theme.bg_normal

--theme.fg_normal     = fg_default
theme.fg_focus      = fg_focus
theme.fg_urgent     = "#CC9393"
theme.fg_minimize   = "#C3BF9F"

-- {{{ Widgets
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.fg_off_widget    = "#494B4F"
theme.fg_netup_widget  = "#7F9F7F"
theme.fg_netdn_widget  = theme.fg_urgent
theme.bg_widget        = theme.bg_normal
theme.border_widget    = theme.bg_normal
-- }}}

theme.border_width  = 1
theme.border_normal = light_black
theme.border_focus  = light_white
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

theme.mouse_finder_color = theme.fg_urgent

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

theme.wallpaper = os.getenv("HOME") .. "/pictures/default-background.jpg"

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
theme.layout_uselesstile     = theme_dir.."/layouts/tile.png"
theme.layout_uselesstileleft = theme_dir.."/layouts/tileleft.png"
theme.layout_uselesspiral    = theme_dir.."/layouts/spiral.png"
theme.layout_uselessfair     = theme_dir.."/layouts/fairv.png"
theme.layout_termfair        = lain_icons.."/layout/zenburn/termfair.png"
theme.layout_centerwork      = lain_icons.."/layout/zenburn/centerwork.png"
theme.layout_centerfair      = lain_icons.."/layout/zenburn/centerfair.png"

theme.awesome_icon = theme_dir.."/awesome.png"

theme.widget_cpu    = theme.confdir .. "/themes/icons/cpu.png"
theme.widget_bat    = theme.confdir .. "/themes/icons/bat.png"
theme.widget_mem    = theme.confdir .. "/themes/icons/mem.png"
theme.widget_fs     = theme.confdir .. "/themes/icons/disk.png"
theme.widget_net    = theme.confdir .. "/themes/icons/down.png"
theme.widget_netup  = theme.confdir .. "/themes/icons/up.png"
theme.widget_wifi   = theme.confdir .. "/themes/icons/wifi.png"
theme.widget_mail   = theme.confdir .. "/themes/icons/mail.png"
theme.widget_vol    = theme.confdir .. "/themes/icons/vol.png"
theme.widget_org    = theme.confdir .. "/themes/icons/cal.png"
theme.widget_date   = theme.confdir .. "/themes/icons/time.png"
theme.widget_crypto = theme.confdir .. "/themes/icons/crypto.png"
theme.widget_sep    = theme.confdir .. "/themes/icons/separator.png"

theme.blingbling = {
    background_color = transparent,
    graph_background_color = widget_background,
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

theme.useless_gap_width = 5

return theme
