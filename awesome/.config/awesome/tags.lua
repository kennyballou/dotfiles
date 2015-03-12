local awful = require("awful")
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
