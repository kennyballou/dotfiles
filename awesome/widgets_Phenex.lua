local awful = require("awful")
local blingbling = require("blingbling")
local vicious = require("vicious")
local wibox = require("wibox")
local beautiful = require("beautiful")
-- Widgets
local separator = wibox.widget.textbox()
separator:set_text("  ")
local bat_text = wibox.widget.textbox()
bat_widget = blingbling.progress_graph.new()
bat_widget:set_height(18)
bat_widget:set_width(40)
bat_widget:set_rounded_size(0.3)
bat_widget:set_show_text(true)
bat_widget:set_horizontal(true)
bat_widget:set_background_color(beautiful.transparent)
bat_widget:set_graph_background_color(beautiful.widget_background)
bat_widget:set_graph_color(beautiful.blue)
bat_widget:set_graph_line_color(beautiful.blue)
vicious.register(bat_text, vicious.widgets.bat, "$1", 120, "BAT0")
vicious.register(bat_widget, vicious.widgets.bat, "$2", 120, "BAT0")

local root_fs_widget = blingbling.progress_graph.new()
root_fs_widget:set_height(18)
root_fs_widget:set_width(40)
root_fs_widget:set_rounded_size(0.3)
root_fs_widget:set_show_text(true)
root_fs_widget:set_horizontal(true)
root_fs_widget:set_label("/ $percent %")
root_fs_widget:set_background_color(beautiful.transparent)
root_fs_widget:set_graph_background_color(beautiful.widget_background)
root_fs_widget:set_graph_color(beautiful.transparent)
root_fs_widget:set_graph_line_color(beautiful.magenta)
vicious.register(root_fs_widget, vicious.widgets.fs, "${/ used_p}", 120)
local loadavg_text = wibox.widget.textbox()
vicious.register(loadavg_text, vicious.widgets.uptime, "$4 $5 $6", 60)
local os_text = wibox.widget.textbox()
vicious.register(os_text, vicious.widgets.os, "$1 $2", 1500)

local cpu_total_graph = blingbling.line_graph.new(
    { height    = 18,
      width     = 160,
      show_text = true,
      label     = "CPU: $percent %",
      rounded_size = 0.3,
      background_color = beautiful.transparent,
      graph_background_color = beautiful.widget_background,
      graph_line_color = beautiful.magenta,
      graph_color = beautiful.transparent,
    })
vicious.register(cpu_total_graph, vicious.widgets.cpu, '$1', 2)

local memgraph = blingbling.line_graph.new(
    { height    = 18,
      width     = 160,
      show_text = true,
      label     = "MEM: $percent %",
      rounded_size = 0.3,
      background_color = beautiful.transparent,
      graph_background_color = beautiful.widget_background,
      graph_line_color = beautiful.magenta,
      graph_color = beautiful.transparent,
    })
vicious.register(memgraph, vicious.widgets.mem, '$1', 2)


local net_text = wibox.widget.textbox()
vicious.register(
    net_text,
    vicious.widgets.net,
    "${wlan0 up_mb} (Mbps) / ${wlan0 down_mb} (Mbps)",
    3)
local wifi_text = wibox.widget.textbox()
vicious.register(
    wifi_text,
    vicious.widgets.wifi,
    "${ssid} (-${link} dBm)",
    3,
    "wlan0")

--mytextclock = awful.widget.textclock('%H:%M:%S', 1)
local mytextclock = blingbling.clock.japanese(" %m、%d、%w、%H 時 %M 分")

generate_layout = function(s, taglist, tasklist, promptbox)

    -- Widgets that are aligned to the left
    local top_left_layout = wibox.layout.fixed.horizontal()
    top_left_layout:add(mylauncher)
    top_left_layout:add(taglist[s])
    top_left_layout:add(promptbox[s])
    top_left_layout:add(cpu_total_graph)
    top_left_layout:add(memgraph)
    top_left_layout:add(root_fs_widget)
    top_left_layout:add(separator)
    top_left_layout:add(net_text)
    top_left_layout:add(separator)
    top_left_layout:add(wifi_text)
    local bot_left_layout = wibox.layout.fixed.horizontal()

    -- Widgets that are aligned to the right
    local top_right_layout = wibox.layout.fixed.horizontal()
    top_right_layout:add(os_text)
    top_right_layout:add(separator)
    top_right_layout:add(loadavg_text)
    top_right_layout:add(toplayoutbox[s])
    local bot_right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then bot_right_layout:add(wibox.widget.systray()) end
    bot_right_layout:add(bat_widget)
    bot_right_layout:add(bat_text)
    bot_right_layout:add(mytextclock)

    local top_layout = wibox.layout.align.horizontal()
    top_layout:set_left(top_left_layout)
    top_layout:set_middle(nil)
    top_layout:set_right(top_right_layout)
    local bot_layout = wibox.layout.align.horizontal()
    bot_layout:set_left(bot_left_layout)
    bot_layout:set_middle(tasklist[s])
    bot_layout:set_right(bot_right_layout)

    return top_layout, bot_layout
end
