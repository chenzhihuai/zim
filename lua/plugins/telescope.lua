return 
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
  }
