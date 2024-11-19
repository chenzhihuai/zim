return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts={
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
          },
        },
      }
    },
    keys={
      {'<leader>ff', ':Telescope find_files<cr>', mode={'n'}, desc="Find files"},
      {'<leader>fs', ':Telescope lsp_document_symbols<cr>', mode={'n'}, desc="Find symbols"},
      {'<leader>fw', ':Telescope live_grep<cr>', mode={'n'}, desc="Live grep"},
      {'<leader>fb', ':Telescope buffers<cr>', mode={'n'}, desc="Find buffers"},
      {'<leader>fo', ':Telescope oldfiles<cr>', mode={'n'}, desc="Find oldfiles"},
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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = { { "<leader>e", "<cmd>Neotree<cr>", "Explorer" } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config= require('config.neotree'),
  },
  {
    "lewis6991/satellite.nvim",
    opts = {}
  },
  -- git
  {
    "NeogitOrg/neogit",
    keys = { { "<leader>gg", "<cmd>Neogit<cr>", "Interactive git interface" } },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts={}
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  -- jump
  {
    'folke/flash.nvim',
    keys = {
      { 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Jump forwards', },
      { 'S', function() require('flash').jump({ search = { forward = false } }) end, mode = { 'n', 'x', 'o' }, desc = 'Jump backwards', },
    },
  }
}
