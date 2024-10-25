local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local vpn_status = sbar.add("item", "widgets.vpn", {
	position = "right",
	icon = {
		font = {
			style = settings.font.style_map["Regular"],
			size = 19.0,
		},
		string = icons.wifi.disconnected,
	},
	label = {
		font = { family = settings.font.numbers },
		string = "VPN: Checking...",
	},
	update_freq = 5,
	popup = { align = "center" },
})

local vpn_ip = "34.95.141.123"

local function is_vpn_connected()
	local handle = io.popen("netstat -rn | grep '" .. vpn_ip .. "'")
	local result = handle:read("*a")
	handle:close()
	return result ~= ""
end

vpn_status:subscribe("routine", function()
	local icon = icons.wifi.disconnected
	local label = "VPN: Disconnected"
	local color = colors.red

	if is_vpn_connected() then
		icon = icons.wifi.connected
		label = "VPN: Connected"
		color = colors.green
	end

	vpn_status:set({
		icon = {
			string = icon,
			color = color,
		},
		label = { string = label },
	})
end)

vpn_status:subscribe("mouse.clicked", function(env)
	local drawing = vpn_status:query().popup.drawing
	vpn_status:set({ popup = { drawing = "toggle" } })
end)

sbar.add("bracket", "widgets.vpn.bracket", { vpn_status.name }, {
	background = { color = colors.bg1 },
})

sbar.add("item", "widgets.vpn.padding", {
	position = "right",
	width = settings.group_paddings,
})
