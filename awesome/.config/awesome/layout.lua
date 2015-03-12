local awful = require("awful")
local wibox = require("wibox")
require("awful_local_utils")
require("widgets_" .. get_hostname())
-- Create a wibox for each screen and add it
topwibox = {}
botwibox = {}
toppromptbox = {}
toplayoutbox = {}
botlayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4,
        function(t)
            awful.tag.viewnext(awful.tag.getscreen(t))
        end),
    awful.button({ }, 5,
        function(t)
            awful.tag.viewprev(awful.tag.getscreen(t))
        end)
    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
    awful.button({ }, 1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                -- Without this, the following
                -- -- :isvisible() makes no sense
                c.minimized = false
                if not c:isvisible() then
                    awful.tag.viewonly(c:tags()[1])
                end
                -- This will also un-minimize
                -- the client, if needed
                client.focus = c
                c:raise()
            end
        end),
    awful.button({ }, 3,
        function()
            if instance then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({ width=250 })
            end
       end),
    awful.button({ }, 4,
        function()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end),
    awful.button({ }, 5,
        function()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    toppromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which
    -- layout we're using.
    -- We need one layoutbox per screen.
    toplayoutbox[s] = awful.widget.layoutbox(s)
    botlayoutbox[s] = awful.widget.layoutbox(s)
    toplayoutbox[s]:buttons(awful.util.table.join(
        awful.button({ }, 1, function() awful.layout.inc(layouts,1) end),
        awful.button({ }, 3, function() awful.layout.inc(layouts,-1) end),
        awful.button({ }, 4, function() awful.layout.inc(layouts,1) end),
        awful.button({ }, 5, function() awful.layout.inc(layouts,-1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(
        s,
        awful.widget.taglist.filter.all,
        mytaglist.buttons
    )

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(
        s,
        awful.widget.tasklist.filter.currenttags,
        mytasklist.buttons
    )

    -- Create the wibox
    topwibox[s] = awful.wibox({position = "top", screen = s})
    botwibox[s] = awful.wibox({position = "bottom", screen = s})

    top_layout, bot_layout = generate_layout(
        s,
        mytaglist,
        mytasklist,
        toppromptbox
    )

    topwibox[s]:set_widget(top_layout)
    botwibox[s]:set_widget(bot_layout)
end
