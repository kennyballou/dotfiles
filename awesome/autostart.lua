local awful = require("awful")
require("awful_local_utils")

autostart = io.open(os.getenv('HOME') .. '/.config/autostart/awesome.autostart')
for i in autostart:lines() do
    run_once(i)
end
autostart:close()
