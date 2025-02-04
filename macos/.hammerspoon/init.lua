hs.hotkey.bind({ "option" }, "l", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --focus next")
end)

hs.hotkey.bind({ "option" }, "h", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --focus prev")
end)

hs.hotkey.bind({ "option", "shift" }, "l", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --display next")
end)

hs.hotkey.bind({ "option", "shift" }, "h", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --display prev")
end)

hs.hotkey.bind({ "option" }, "m", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --toggle zoom-fullscreen")
end)

hs.hotkey.bind({ "option", "shift" }, "up", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --resize top:0:50")
end)

hs.hotkey.bind({ "option", "shift" }, "down", function()
	hs.execute("/opt/homebrew/bin/yabai -m window --resize bottom:0:50")
end)

hs.hotkey.bind({ "option" }, "t", function()
	hs.execute("/opt/homebrew/bin/yabai -m space --layout stack")
end)

hs.hotkey.bind({ "option" }, "b", function()
	hs.execute("/opt/homebrew/bin/yabai -m space --layout bsp")
end)

hs.hotkey.bind({ "option" }, "f", function()
	hs.execute("/opt/homebrew/bin/yabai -m space --layout float")
end)

hs.hotkey.bind({ "option" }, "1", function()
	hs.execute("/opt/homebrew/bin/yabai -m space --focus 1")
end)

hs.hotkey.bind({ "option" }, "2", function()
	hs.execute("/opt/homebrew/bin/yabai -m space --focus 2")
end)

hs.hotkey.bind({ "option" }, "n", function()
	hs.execute("yabai -m window --toggle min")
end)
