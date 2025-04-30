local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local vpn_ip = "34.95.141.123"

local vpn = sbar.add("item", "widgets.vpn", {
  position = "right",
  icon = {
    font = {
      style = settings.font.style_map["Regular"],
      size = 19.0,
    },
    string = icons.vpn.disconnected,
  },
  label = {
    font = { family = settings.font.numbers },
    string = "Not Connected",
  },
  update_freq = 5,
  popup = { align = "center" },
})

local function is_vpn_connected()
  local handle = io.popen("netstat -rn | grep '" .. vpn_ip .. "'")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

vpn:subscribe("routine", function()
  local icon = icons.vpn.disconnected
  local label = "Not Connected"
  local color = colors.red

  if is_vpn_connected() then
    icon = icons.vpn.connected
    label = "Connected"
    color = colors.green
  end

  vpn:set({
    icon = {
      string = icon,
      color = color,
    },
    label = { string = label },
  })
end)

vpn:subscribe("mouse.clicked", function(env)
  local drawing = vpn:query().popup.drawing
  vpn:set({ popup = { drawing = "toggle" } })
end)

-- Remove bracket and padding unless needed, they are not present in your code
-- sbar.add("bracket", "widgets.vpn.bracket", { vpn.name }, {
-- 	background = { color = colors.bg1 },
-- })

-- sbar.add("item", "widgets.vpn.padding", {
-- 	position = "right",
-- 	width = settings.group_paddings,
-- })

local popup_width = 250

local ip = sbar.add("item", {
  position = "popup." .. vpn.name,
  icon = {
    align = "left",
    string = "IP:",
    width = popup_width / 2,
  },
  label = {
    string = "???.???.???.???",
    width = popup_width / 2,
    align = "right",
  },
})

local mask = sbar.add("item", {
  position = "popup." .. vpn.name,
  icon = {
    align = "left",
    string = "Subnet mask:",
    width = popup_width / 2,
  },
  label = {
    string = "???.???.???.???",
    width = popup_width / 2,
    align = "right",
  },
})

local router = sbar.add("item", {
  position = "popup." .. vpn.name,
  icon = {
    align = "left",
    string = "Router:",
    width = popup_width / 2,
  },
  label = {
    string = "???.???.???.???",
    width = popup_width / 2,
    align = "right",
  },
})

local function hide_details()
  vpn:set({ popup = { drawing = false } })
end

local function toggle_details()
  local should_draw = vpn:query().popup.drawing == "off"
  if should_draw then
    vpn:set({ popup = { drawing = true } })
    sbar.exec("ipconfig getifaddr en1", function(result)
      ip:set({ label = result })
    end)
    sbar.exec(
      "networksetup -getinfo Wi-Fi | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'",
      function(result)
        mask:set({ label = result })
      end
    )
    sbar.exec(
      "networksetup -getinfo Wi-Fi | awk -F 'Router: ' '/^Router: / {print $2}'",
      function(result)
        router:set({ label = result })
      end
    )
  else
    hide_details()
  end
end

local function copy_label_to_clipboard(env)
  local label = sbar.query(env.NAME).label.value
  sbar.exec('echo "' .. label .. '" | pbcopy')
  sbar.set(env.NAME, { label = { string = icons.clipboard, align = "center" } })
  sbar.delay(1, function()
    sbar.set(env.NAME, { label = { string = label, align = "right" } })
  end)
end

ip:subscribe("mouse.clicked", copy_label_to_clipboard)
mask:subscribe("mouse.clicked", copy_label_to_clipboard)
router:subscribe("mouse.clicked", copy_label_to_clipboard)

vpn:subscribe("mouse.clicked", function()
  toggle_details()
end)
