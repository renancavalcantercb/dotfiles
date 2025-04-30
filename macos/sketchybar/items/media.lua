local icons = require "icons"
local colors = require("colors").sections.media or {
  label = "0xffaaffcc",
}

local media_playback = sbar.add("item", "widgets.media", {
  position = "right",
  icon = {
    max_chars = 50,
    padding_left = 8,
  },
  label = { string = icons.separators.left .. " " .. icons.music, color = colors.label, padding_right = 8 },
  update_freq = 5,
  padding_right = 8,
})

sbar.add("item", {
  position = "popup." .. media_playback.name,
  padding_left = 6,
  padding_right = 6,
  icon = { string = icons.media.back },
  label = { drawing = false },
  background = { drawing = false },
  click_script = "nowplaying-cli previous",
})
sbar.add("item", {
  position = "popup." .. media_playback.name,
  padding_left = 6,
  padding_right = 6,
  icon = { string = icons.media.play_pause },
  label = { drawing = false },
  background = { drawing = false },
  click_script = "nowplaying-cli togglePlayPause",
})
sbar.add("item", {
  position = "popup." .. media_playback.name,
  padding_left = 6,
  padding_right = 6,
  icon = { string = icons.media.forward },
  label = { drawing = false },
  background = { drawing = false },
  click_script = "nowplaying-cli next",
})

media_playback:subscribe({ "routine" }, function()
  local icon = ""
  local label = icons.separators.left .. " " .. icons.music

  local handle = io.popen "/Users/renan-dev/Desktop/estudos/nowplaying/main.py"
  local out = handle:read("*a"):gsub("%s+$", "")
  handle:close()

  if out == "NONE" then
    media_playback:set { drawing = true, label = { string = "Spotify", color = colors.label } }
  else
    local name, artist, cover = out:match "^(.-)%|%|%|(.-)%|%|%|(.*)$"
    label = string.format("%s — %s %s", name, artist, icons.music)
    if name and artist then
      media_playback:set {
        drawing = true,
        icon = icon,
        label = { string = label },
      }
    end
  end
end)

media_playback:subscribe("mouse.clicked", function(_)
  sbar.animate("tanh", 8, function()
    media_playback:set {
      background = {
        shadow = {
          distance = 0,
        },
      },
      y_offset = -4,
      padding_left = 8,
      padding_right = 4,
    }
    media_playback:set {
      background = {
        shadow = {
          distance = 4,
        },
      },
      y_offset = 0,
      padding_left = 4,
      padding_right = 8,
    }
  end)
  media_playback:set { popup = { drawing = "toggle", horizontal = true } }
end)