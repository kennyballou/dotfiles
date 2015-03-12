local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
