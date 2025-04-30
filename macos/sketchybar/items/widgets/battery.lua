local icons = require "icons"
local colors = require("colors").sections.widgets.battery
local settings = require "settings"

local battery = sbar.add("item", "widgets.battery", {
  position = "right",
  icon = {
    padding_left = 8,
    padding_right = 4,
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
    },
  },
  label = { drawing = false },
  padding_left = 10,
  padding_right = 4,
  update_freq = 180,
  popup = { align = "center", y_offset = 4 },
})

local remaining_time = sbar.add("item", {
  position = "popup." .. battery.name,
  icon = {
    string = "Time remaining:",
    width = 100,
    align = "left",
  },
  label = {
    string = "??:??h",
    width = 100,
    align = "right",
  },
})

battery:subscribe({ "routine", "power_source_change", "system_woke" }, function()
  sbar.exec("pmset -g batt", function(batt_info)
    local icon = "!"
    local charge = nil -- Declare charge outside the first 'if' block

    local found, _, charge_str = batt_info:find "(%d+)%%"
    if found then
      charge = tonumber(charge_str)
    end

    local color = colors.high
    local charging, _, _ = batt_info:find "AC Power"

    if charging then
      icon = icons.battery.charging
    else
      if charge then
        if charge > 80 then
          icon = icons.battery._100
        elseif charge > 60 then
          icon = icons.battery._75
        elseif charge > 40 then
          icon = icons.battery._50
        elseif charge > 30 then
          icon = icons.battery._50
          color = colors.mid
        elseif charge > 20 then
          icon = icons.battery._25
          color = colors.mid
        else
          icon = icons.battery._0
          color = colors.low
        end
      else
        icon = icons.battery._0 -- Default icon if charge is not found
        color = colors.low
      end
    end

    -- Include percentage in the label
    local label_text = charge and charge .. "%" or "N/A"

    battery:set {
      icon = {
        string = icon .. " " .. label_text, -- Concatenate icon and percentage
        color = color,
      },
    }
  end)
end)

battery:subscribe("mouse.clicked", function()
  local drawing = battery:query().popup.drawing

  sbar.animate("tanh", 8, function()
    battery:set {
      background = {
        shadow = {
          distance = 0,
        },
      },
      y_offset = -4,
      padding_left = 14,
      padding_right = 0,
    }
    battery:set {
      background = {
        shadow = {
          distance = 4,
        },
      },
      y_offset = 0,
      padding_left = 10,
      padding_right = 4,
    }
  end)

  battery:set { popup = { drawing = "toggle" } }

  if drawing == "off" then
    sbar.exec("pmset -g batt", function(batt_info)
      local found, _, remaining = batt_info:find " (%d+:%d+) remaining"
      local label = found and remaining .. "h" or "No estimate"
      remaining_time:set { label = label }
    end)
  end
end)
