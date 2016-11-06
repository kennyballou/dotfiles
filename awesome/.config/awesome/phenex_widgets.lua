local awful = require("awful")
local blingbling = require("blingbling")
local lain = require("lain")
local vicious = require("vicious")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- {{{ Wibox
local config = awful.util.getdir("config")
local theme_dir = config .. "/themes"
local theme_file = theme_dir .. "/theme.lua"
beautiful.init(theme_file)
blingbling.superproperties.init(theme_file)
local separator = wibox.widget.textbox()
separator:set_text("  ")
local separatoricon = wibox.widget.imagebox()
separatoricon:set_image(beautiful.widget_sep)

-- {{{ CPU
local cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpugraph = awful.widget.graph()
cpugraph:set_width(130):set_height(36)
cpugraph:set_background_color(beautiful.fg_off_widget)
cpugraph:set_color({
    type = "linear",
    from = {0, 0}, to = {0, 18},
    stops = {
        {0, beautiful.fg_end_widget},
        {0.2, beautiful.red},
        {0.4, beautiful.yellow},
        {0.5, beautiful.fg_center_widget},
        {1.0, beautiful.fg_widget}
    }
})
vicious.register(cpugraph, vicious.widgets.cpu, "$1")
-- }}}

-- {{{ Memory
local memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)
membar = awful.widget.progressbar()
membar:set_vertical(true):set_ticks(true)
membar:set_height(18):set_width(10):set_ticks_size(4)
membar:set_background_color(beautiful.fg_off_widget)
membar:set_color({
    type = "linear",
    from = {0, 0}, to = {0, 18},
    stops = {
        {0, beautiful.fg_end_widget},
        {0.2, beautiful.red},
        {0.4, beautiful.yellow},
        {0.5, beautiful.fg_center_widget},
        {1.0, beautiful.fg_widget}
    }
})
vicious.register(membar, vicious.widgets.mem, "$1", 13)
-- }}}

local fsicon = wibox.widget.imagebox()
fsicon:set_image(beautiful.widget_fs)
local netupicon = wibox.widget.imagebox()
netupicon:set_image(beautiful.widget_netup)
local netdnicon = wibox.widget.imagebox()
netdnicon:set_image(beautiful.widget_net)

-- Create a textclock widget
local clockicon = wibox.widget.imagebox()
clockicon:set_image(beautiful.widget_date)
local cur_day_month = " <span size=\"large\" "
                   .. "rise=\"-2500\" "
                   .. "color=\""..beautiful.blue .."\">%d、</span>"
local cur_month = " <span size=\"large\" "
               .. "rise=\"-2500\" "
               .. "color=\""..beautiful.yellow.."\">%m、</span>"
local cur_day_week = " <span size=\"large\" "
                  .. "rise=\"-2500\" "
                  .. "color=\""..beautiful.green.."\">%w、</span>"
local cur_hour = " <span size=\"large\" "
              .. "rise=\"-2500\" "
              .. "font_weight=\"bold\">%H<span color=\""
              .. beautiful.red.."\" font_weight=\"normal\">時</span>%M"
              .. "<span color=\""
              .. beautiful.red.."\" font_weight=\"normal\">分</span></span>"
local mytextclock = blingbling.clock.japanese(
    cur_month .. cur_day_month .. cur_day_week .. cur_hour,
    {h_margin = 2,
     v_margin = 2,
     text_background_color = beautiful.widget_background,
     rounded_size = 0.3})

-- Task Warrior Active Task Widget
local taskwactive = lain.widgets.base({
    timeout = 29,
    cmd = "active_task.sh",
    settings = function()
        widget:set_text(" " .. string.sub(output, 1, 25))
    end
})

-- System Load
local loadavg_text = wibox.widget.textbox()
vicious.register(loadavg_text, vicious.widgets.uptime, "$4", 60)

-- Filesystem Widgets
local fs = {
    boot = awful.widget.progressbar(),
    root = awful.widget.progressbar()
}
for _, w in pairs(fs) do
    w:set_vertical(true):set_ticks(true)
    w:set_height(18):set_width(10):set_ticks_size(4)
    w:set_border_color(beautiful.border_widget)
    w:set_background_color(beautiful.fg_off_widget)
    w:set_color({
        type = "linear",
        from = {0, 0}, to = {0, 18},
        stops = {
            {0, beautiful.fg_end_widget},
            {0.2, beautiful.red},
            {0.4, beautiful.yellow},
            {0.5, beautiful.fg_center_widget},
            {1.0, beautiful.fg_widget}
        }
    })
end
vicious.cache(vicious.widgets.fs)
vicious.register(fs.boot, vicious.widgets.fs, "${/boot used_p}", 599)
vicious.register(fs.root, vicious.widgets.fs, "${/ used_p}", 599)

local net_text = wibox.widget.textbox()
vicious.register(
    net_text,
    vicious.widgets.net, '<span color="' ..
    beautiful.fg_netup_widget .. '">${wlan0 up_kb}</span> <span color="' ..
    beautiful.fg_netdn_widget .. '">${wlan0 down_mb}</span>',
    3
)
local wifi_text = wibox.widget.textbox()
vicious.register(
    wifi_text,
    vicious.widgets.wifi,
    "${ssid} (${sign} dBm)",
    3,
    "wlan0")

generate_layout = function(s, taglist, tasklist, promptbox)
    -- Widgets that are aligned to the left
    local top_left_layout = wibox.layout.fixed.horizontal()
    top_left_layout:add(toplayoutbox[s])
    top_left_layout:add(taglist[s])
    top_left_layout:add(separatoricon)
    top_left_layout:add(cpuicon)
    top_left_layout:add(cpugraph)
    top_left_layout:add(separatoricon)
    top_left_layout:add(memicon)
    top_left_layout:add(membar)
    top_left_layout:add(separatoricon)
    top_left_layout:add(fsicon)
    top_left_layout:add(fs.boot)
    top_left_layout:add(fs.root)
    top_left_layout:add(separatoricon)
    top_left_layout:add(netupicon)
    top_left_layout:add(net_text)
    top_left_layout:add(netdnicon)
    top_left_layout:add(separator)
    top_left_layout:add(wifi_text)
    top_left_layout:add(separatoricon)
    top_left_layout:add(separator)
    top_left_layout:add(loadavg_text)
    top_left_layout:add(separator)
    top_left_layout:add(taskwactive)
    top_left_layout:add(separator)
    top_left_layout:add(promptbox[s])

    -- Widgets that are aligned to the right
    local top_right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then top_right_layout:add(wibox.widget.systray()) end
    top_right_layout:add(separatoricon)
    top_right_layout:add(clockicon)
    top_right_layout:add(mytextclock)

    local top_layout = wibox.layout.align.horizontal()
    top_layout:set_left(top_left_layout)
    top_layout:set_middle(nil)
    top_layout:set_right(top_right_layout)

    return top_layout
end
