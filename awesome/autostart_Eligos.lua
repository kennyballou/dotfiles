local awful = require("awful")
require("awful_local_utils")

local autostart =
{
    "light-locker",
    "qjackctl",
    "dropboxd",
    "nm-applet",
    "keepassx",
}
for _, i in pairs(autostart) do
    run_once(i)
end
