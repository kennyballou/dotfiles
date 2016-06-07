-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")
local blingbling = require("blingbling")
beautiful.init(awful.util.getdir("config") .. "/themes/theme.lua")
require("awful_local_utils")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}


-- {{{ Variable definitions
-- This is used later as the default terminal and editor to run.
local hostname = get_hostname()
terminal = "terminator"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with
-- others.
ALT = "Mod1"
SUPER = "Mod4"
ALTGr = "Mod5"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
local tag_list_set =
    { arabic   = {1, 2, 3, 4, 5, 6, 7, 8, 9 , 0},
      japanese = {" 一 ", " 二 ", " 三 ", " 四 ", " 五 ",
                  " 六 " , " 七 "," 八 "," 九 ", " 十 "},
    }
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tag_list_set['japanese'], s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "term", terminal },
   { "ranger", "urxvt -e ranger" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu(
    { items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                { "open terminal", terminal }
              }
    })

mylauncher = awful.widget.launcher(
    { image = beautiful.awesome_icon,
      menu = mymainmenu
    }
)

-- Menubar configuration
menubar.utils.terminal = terminal
-- }}}

require(hostname .. "_widgets")

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
    --botlayoutbox[s] = awful.widget.layoutbox(s)
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
    --botwibox[s] = awful.wibox({position = "bottom", screen = s})

    top_layout = generate_layout(
        s,
        mytaglist,
        mytasklist,
        toppromptbox
    )

    topwibox[s]:set_widget(top_layout)
end
-- }}}

-- {{{ Keys
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
        function() awful.util.spawn("urxvt -e ranger") end)
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
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial
        -- position.
        if not c.size_hints.user_position and
           not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus",
    function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
    function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Autostart
autostart = io.open(os.getenv('HOME') .. '/.config/autostart/awesome.autostart')
for i in autostart:lines() do
    pair = string.gmatch(i, "([^;]+)")
    cmd_name = pair()
    cmd_args = pair()
    run_once(cmd_name, cmd_args)
end
autostart:close()
-- }}}
