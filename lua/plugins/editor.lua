return {
  -- {
    -- 	"nvimdev/dashboard-nvim",
    -- 	dependencies = { {'nvim-tree/nvim-web-devicons'}},
    -- 	opts=true
    -- },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts={},
      keys={
        {'<leader>ff', ':Telescope find_files<cr>', mode={'n'}, desc="Find files"},
        {'<leader>fs', ':Telescope lsp_document_symbols<cr>', mode={'n'}, desc="Find symbols"},
        {'<leader>fr', ':Telescope live_grep<cr>', mode={'n'}, desc="Live grep"},
        {'<leader>fb', ':Telescope buffers<cr>', mode={'n'}, desc="Find buffers"},
      }
    },
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = true,
      keys={
        { mode = { 'v', 'n' }, '<Leader>tf', '<cmd>Toggleterm direction=float<cr>', desc = 'Toggle term float', },
        { mode = { 'v', 'n' }, '<Leader>tb', '<cmd>Toggleterm <cr>', desc = 'Toggle term in bottom', },
      }
    },
    {

      'mrjones2014/legendary.nvim',
      -- since legendary.nvim handles all your keymaps/commands,
      -- its recommended to load legendary.nvim before other plugins
      priority = 10000,
      lazy = false,
      -- sqlite is only needed if you want to use frecency sorting
      -- dependencies = { 'kkharji/sqlite.lua' }
      dependencies = {'stevearc/dressing.nvim' },
      keys = {{"<c-s-p>", "<cmd>Legendary<cr>", "Command Palette"}},
      opts = require("config.legendary")
    },
    -- {
    --   "nvim-tree/nvim-tree.lua",
    --   keys = {{"<leader>e", "<cmd>NvimTreeOpen<cr>", "Explorer"}},
  --   opts={
  --     sort = {
  --       sorter = "case_sensitive",
  --     },
  --     view = {
  --       width = 30,
  --     },
  --     renderer = {
  --       group_empty = true,
  --     },
  --     filters = {
  --       dotfiles = true,
  --     },
  --   }
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = { { "<leader>e", "<cmd>Neotree<cr>", "Explorer" } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = require('config.evil_lualine')
  -- },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   opts = require("config.bufferline"),
  -- },
  {
    "lewis6991/satellite.nvim",
    opts = require('config.satellite')
  }
}
