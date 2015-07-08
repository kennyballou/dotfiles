local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ALT, "Control",}, "Left", awful.tag.viewprev),
    awful.key({ALT, "Control",}, "Right", awful.tag.viewnext),
    awful.key({SUPER,}, "Escape", awful.tag.history.restore),

    awful.key({ALT,}, "j",
        function()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ALT,}, "k",
        function()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),

    -- Layout manipulation
    awful.key({ALT, "Shift",}, "j",
        function() awful.client.swap.byidx(1) end),
    awful.key({ALT, "Shift",}, "k",
        function() awful.client.swap.byidx(-1) end),
    awful.key({ALT, "Control",}, "j",
        function() awful.screen.focus_relative(1) end),
    awful.key({ALT, "Control"}, "k",
        function() awful.screen.focus_relative(-1) end),
    awful.key({ALT,}, "u", awful.client.urgent.jumpto),

    -- Standard program
    awful.key({ALT,}, "Return",
        function() awful.util.spawn(terminal) end),
    awful.key({ALT, "Control",}, "r", awesome.restart),
    awful.key({ALT, "Shift",}, "q", awesome.quit),

    awful.key({ALT,}, "l",
        function() awful.tag.incmwfact(0.05) end),
    awful.key({ALT,}, "h",
        function() awful.tag.incmwfact(-0.05) end),
    awful.key({ALT, "Shift",}, "h",
        function() awful.tag.incnmaster(1) end),
    awful.key({ALT, "Shift",}, "l",
        function() awful.tag.incnmaster(-1) end),
    awful.key({ALT, "Control"}, "h",
        function() awful.tag.incncol( 1) end),
    awful.key({ALT, "Control"}, "l",
        function() awful.tag.incncol(-1) end),
    awful.key({SUPER,}, "space",
        function() awful.layout.inc(layouts,  1) end),
    awful.key({SUPER, "Shift"}, "space",
        function() awful.layout.inc(layouts, -1) end),

    awful.key({ALT, "Control"}, "n", awful.client.restore),
    -- Prompt
    awful.key({ALT,}, "p",
        function () toppromptbox[mouse.screen]:run() end),
    awful.key({ALT,}, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  toppromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ALT,}, "space",
              function()
                awful.util.spawn("dmenu_run -p '%'" ..
                                 " -nb '" .. beautiful.bg_normal .. "'" ..
                                 " -nf '" .. beautiful.fg_normal .. "'" ..
                                 " -sb '" .. beautiful.bg_focus .. "'" ..
                                 " -sf '" .. beautiful.fg_focus .. "'")
               end),
    awful.key({ALT, "Control",}, "l",
        function() awful.util.spawn("dm-tool switch-to-greeter") end),
    awful.key({ALT, }, "/",
        function() awful.util.spawn("terminator -e ranger") end)
)

clientkeys = awful.util.table.join(
    awful.key({ALT,}, "f",
        function (c) c.fullscreen = not c.fullscreen end),
    awful.key({ALT,}, "q",
        function (c) c:kill() end),
    awful.key({ALT, "Control",}, "space",  awful.client.floating.toggle),
    awful.key({ALT, "Control",}, "Return",
        function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ALT,}, "o", awful.client.movetoscreen),
    awful.key({ALT,}, "t",
        function (c) c.ontop = not c.ontop end),
    awful.key({ALT,}, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ALT,}, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({SUPER,}, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({SUPER, "Control",}, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({SUPER, "Shift",}, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({SUPER, "Control", "Shift",}, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ALT,}, 1, awful.mouse.client.move),
    awful.button({ALT,}, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}
