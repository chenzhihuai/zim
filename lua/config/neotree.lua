return function()
  local get_theme_tb = require('base46').get_theme_tb
  local colors = get_theme_tb "base_30"
  -- local colors=require "base46.colors"
  vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator',{fg=colors.darker_black, bg=colors.darker_black})
  vim.api.nvim_set_hl(0, 'NeoTreeNormal',{bg=colors.darker_black})
  vim.api.nvim_set_hl(0, 'NeoTreeNormalNC',{bg=colors.darker_black})
end
