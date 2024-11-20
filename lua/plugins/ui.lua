return {
  {
    "chenzhihuai/nvchad-ui",
    config = function()
      require "nvchad"
      local map = vim.keymap.set
      map('n', 'Q', require("nvchad.tabufline").close_buffer)
      map('n', '[b', require("nvchad.tabufline").prev)
      map('n', ']b', require("nvchad.tabufline").next)
      map('n', '<leader>tf', function() require("nvchad.term").toggle { pos = "float", id = "fa", cmd ='pwsh' } end)
      map('n', '<leader>tb', function() require("nvchad.term").toggle { pos = "bo sp", id = "fa", cmd ='pwsh' } end)
      map('t', '<esc><esc>', function() require("nvchad.term").toggle { pos = "bo sp", id = "fa", cmd ='pwsh' } end)
    end
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    'b0o/incline.nvim',
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
          overlap={
            borders = true,
            statusline = false,
            tabline = false,
            winbar = true
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#44406e',
          }
        end,
      }
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },

  -- better quickfix
  { 'kevinhwang91/nvim-bqf', opts={} }, -- TODO: shortcut

  {
    'tzachar/highlight-undo.nvim',
    opts={}
  },
  -- scrollbar
  { "lewis6991/satellite.nvim", opts = {} },
  -- {'petertriho/nvim-scrollbar', opts={}}
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
