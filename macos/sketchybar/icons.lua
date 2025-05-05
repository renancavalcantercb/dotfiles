local settings = require "settings"

local icons = {
  sf_symbols = {
    plus = "􀅼",
    loading = "􀖇",
    apple = "􀣺",
    gear = "􀍟",
    cpu = "󰒆",
    clipboard = "􀉄",
    music = "􀑪",
    calendar = "􀐫",
    message = "􁋬",
    separators = {
      left = "􀄪",
      right = "􀄫",
    },
    space_indicator = {
      on = "󰄯",
      off = "󰄰",
    },
    switch = {
      on = "􁏮",
      off = "􁏯",
    },
    volume = {
      _100 = "􀊨",
      _66 = "􀊦",
      _33 = "􀊤",
      _10 = "􀊠",
      _0 = "􀊢",
    },
    battery = {
      _100 = "􀛨",
      _75 = "􀺸",
      _50 = "􀺶",
      _25 = "􀛩",
      _0 = "􀛪",
      charging = "􀢋",
    },
    vpn = {
      upload = "􀄨",
      download = "􀄩",
      connected = "􀙇",
      disconnected = "􀙈",
      router = "􁓤",
      vpn = "󰌾",
      test = "",
    },
    media = {
      back = "􀊊",
      forward = "􀊌",
      play_pause = "􀊈",
    },
    ramicons = {
      swap = "󰁄",
      ram = "󰍛",
    },
  },

  -- Definindo a categoria NerdFont
  nerdfont = {
    -- Ícones já existentes ou movidos para cá que parecem ser Nerd Font
    apple = "",
    gear = "⚙",
    cpu = "󰒆",
    space_indicator = {
      on = "󰄯",
      off = "󰄰",
    },
    vpn = { -- Mantendo a estrutura completa como em sf_symbols
      upload = " upload", -- Exemplo Nerd Font upload
      download = " download", -- Exemplo Nerd Font download
      connected = " link", -- Exemplo Nerd Font link
      disconnected = " unlink", -- Exemplo Nerd Font unlink
      router = "󰖏", -- Exemplo Nerd Font router
      vpn = "󰌾", -- Este já parecia ser NF
      test = "", -- Este já parecia ser NF
    },
    ramicons = {
      swap = "󰁄", -- Este já parecia ser NF
      ram = "󰍛", -- Este já parecia ser NF
    },

    -- Ícones preenchidos com exemplos de Nerd Font (copiando a estrutura de sf_symbols)
    plus = "✚", -- Exemplo Nerd Font plus
    loading = "spinner", -- Exemplo Nerd Font spinner
    clipboard = "󰅇", -- Exemplo Nerd Font clipboard
    music = "", -- Exemplo Nerd Font music
    calendar = "", -- Exemplo Nerd Font calendar
    message = "メッセージ", -- Exemplo Nerd Font message

    separators = {
      left = "", -- Exemplo de glifo Nerd Font para separador esquerdo
      right = "", -- Exemplo de glifo Nerd Font para separador direito
    },
    switch = {
      on = "", -- Exemplo de glifo Nerd Font para switch "on" (ligado)
      off = "", -- Exemplo de glifo Nerd Font para switch "off" (desligado)
    },
    volume = {
      _100 = "󰕾", -- Exemplo Nerd Font volume-high
      _66 = "󰕿", -- Exemplo Nerd Font volume-medium
      _33 = "󰖀", -- Exemplo Nerd Font volume-low
      _10 = "󰖀", -- Exemplo Nerd Font volume-low
      _0 = " mute", -- Exemplo Nerd Font volume-mute (Nota: tem um espaço antes)
    },
    battery = {
      _100 = "󰁹", -- Exemplo Nerd Font battery 100%
      _75 = "󰂁", -- Exemplo Nerd Font battery 75%
      _50 = "󰂆", -- Exemplo Nerd Font battery 50%
      _25 = "󰂊", -- Exemplo Nerd Font battery 25%
      _0 = "󰁺", -- Exemplo Nerd Font battery empty
      charging = "󰂏", -- Exemplo Nerd Font battery charging
    },
    media = {
      back = " backward", -- Exemplo Nerd Font skip-previous (Nota: tem um espaço antes)
      forward = " forward", -- Exemplo Nerd Font skip-next (Nota: tem um espaço antes)
      play_pause = "󰎊", -- Exemplo Nerd Font play-pause combined
    },
  },
}

-- Retorna os ícones dependendo da configuração
if settings.icons == "NerdFont" then
  return icons.nerdfont
else
  return icons.sf_symbols
end
