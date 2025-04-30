local M = {}

local with_alpha = function(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
    return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

local transparent = 0x00000000

-- Cores adaptadas para o estilo Tokyo Night
local tokyo_night = {
  base = 0xff1a1b26,  -- Fundo escuro (azul muito escuro)
  surface = 0xff222436,  -- Superfície (roxo escuro)
  overlay = 0xff2a2e3b,  -- Sobreposição (roxo acinzentado)
  muted = 0xff6e6a86,  -- Cinza acinzentado
  subtle = 0xff8a8c9b,  -- Cinza mais suave
  text = 0xffc0caf5,  -- Texto claro (azul claro)
  love = 0xffeb6f92,  -- Rosa suave
  gold = 0xfff6c177,  -- Dourado suave
  rose = 0xfff5c2e7,  -- Rosa claro
  iris = 0xffc4a7e7,  -- Roxo claro
  pine = 0xff5db1b2,  -- Verde azulado suave
  foam = 0xff9ccfd8,  -- Azul claro
  highlight_low = 0xff21202e,  -- Fundo escuro para destaques baixos
  highlight_med = 0xff3b3f5b,  -- Destaque médio (roxo mais suave)
  highlight_high = 0xff524f67,  -- Destaque alto (roxo acinzentado)
}

local theme = tokyo_night

M.sections = {
  bar = {
    bg = with_alpha(tokyo_night.overlay, 0.6),  -- Transparência sobre o fundo escuro
    border = theme.highlight_low,
  },
  item = {
    bg = theme.overlay,
    border = theme.base,
    text = theme.text,
  },
  apple = theme.rose,  -- Rosa para destacar
  spaces = {
    icon = {
      color = theme.subtle,
      highlight = theme.text,
    },
    label = {
      color = theme.subtle,
      highlight = theme.gold,
    },
    indicator = theme.iris,
  },
  media = {
    label = theme.subtle,
  },
  widgets = {
    battery = {
      low = theme.love,  -- Rosa para bateria baixa
      mid = theme.gold,  -- Dourado para bateria média
      high = theme.pine,  -- Verde azulado para bateria alta
    },
    vpn = { icon = theme.rose },  -- Rosa para o ícone de vpn
    volume = {
      icon = theme.foam,  -- Azul claro para o ícone de volume
      popup = {
        item = theme.subtle,
        highlight = theme.text,
      },
      slider = {
        highlight = theme.foam,
        bg = theme.highlight_med,
        border = theme.highlight_low,
      },
    },
    messages = { icon = theme.love },  -- Rosa para mensagens
  },
  calendar = {
    label = theme.subtle,
  },
}

return M
