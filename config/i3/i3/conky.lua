local function powerline_separator(color)
   local color = color or "#c07830"
   return '{"full_text": "", "color": "' .. color .. '"},'
end

local function bar_separator(color)
   local color = color or "#c07830"
   return '{"full_text": "|", "color": "' .. color .. '"}'
end

local function separator(color)
   return bar_separator(color)
end

local function mail_items(_t)
   local new_mails = conky_parse("${new_mails ~/.mail 300}")
   if new_mails == '' then
      return ''
   else
      return '{"full_text": ""},'
   end
end

local function local_weather(_t)
   local weather = conky_parse([[${weather }]])
   return '🌞'
end

local function cpu_percent(_t)
   local average = conky_parse('${cpu cpu0}')
   return '{"full_text": "☢' .. average .. '"},'
end

local function cpu_temperature(_t)
   local temperature = conky_parse('${apcupsd_temp}')
   return '{"full_text": "🌡' .. temperature .. '"},'
end

local function ram_percent(_t)
   local mem_percent = conky_parse('${memperc}')
   return ',{"full_text": "🐏' .. mem_percent .. '"},'
end

local function fs_use_percent(fs, _t)
   local used_percent = conky_parse('${fs_used_perc ' .. fs .. '}')
   return '{"full_text": "' .. used_percent .. '"},'
end

local function clock(_t)
   local ts = conky_parse('${time %H:%M}');
   return '{"full_text": "🕘' .. ts .. '"},'
end

local function power_display(_t)
   local plug_symbol = '🔌'
   local bat_symbol = '🦇'
   local bat_percent = conky_parse('${battery_percent}')
   local bat_time = conky_parse('${battery_time}')
   local bat_status = conky_parse('${battery_short}')
   local output = ''
   if bat_status == 'U'
      or bat_status == 'N'
      or bat_status == 'F'
   then
      output = plug_symbol
   elseif bat_status == 'C' then
      output = plug_symbol .. ' ' .. bat_percent
   elseif bat_status == 'D' then
      output = bat_percent
   end
   return '{"full_text": "' .. output .. '"},'
end

local function network_display(_t)
   local wifi_sym = ''
   local eth_sym = '🖧'
   local wifi_if_up = conky_parse('${if_up wlan0}1${else}0${endif}')
   local eth_if_up = conky_parse('${if_up eno1}1${else}0${endif}')
   return '{"full_text": "' .. eth_sym .. '"},'
end

json_output = ''

function conky_update_output()
   json_output = ''
      .. mail_items()
      .. separator()
      .. ram_percent()
      .. separator()
      .. cpu_percent()
      .. separator()
      .. cpu_temperature()
      .. separator()
      .. fs_use_percent("/home")
      .. separator()
      .. power_display()
      .. separator()
      .. clock()
end

conky_update_output()
