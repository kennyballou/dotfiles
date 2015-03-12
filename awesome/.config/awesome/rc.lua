-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")
local blingbling = require("blingbling")
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

local hostname = get_hostname()

-- {{{ Variable definitions
require("var_def")
-- }}}

-- {{{ Wallpaper
require("wallpaper")
-- }}}

-- {{{ Tags
require("tags")
-- }}}

-- {{{ Menu
require("menu")
-- }}}

-- {{{ Wibox
require("widgets_" .. hostname)
require("layout")
-- }}}

-- {{{ Keys
require("keybindings")
-- }}}

-- {{{ Rules
require("rules")
-- }}}

-- {{{ Signals
require("signals")
-- }}}

-- {{{ Autostart
require("autostart")
-- }}}
