local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "terminator", terminal },
   { "ranger", terminal.." -e ranger" },
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
