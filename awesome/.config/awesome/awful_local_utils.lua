local awful = require("awful")

get_hostname = function ()
    hostname = os.getenv("HOSTNAME")
    if hostname == nil then
        io.input("/etc/hostname")
        hostname = io.read("*line")
        io.close()
    end
    return hostname
end

function run_once(cmd_name, cmd_args)
    awful.util.spawn_with_shell(
        "pgrep -u $USER -x " .. cmd_name ..
        " || (" .. cmd_name .. (cmd_args or "") .. ")"
    )
end
