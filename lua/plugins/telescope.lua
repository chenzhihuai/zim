return {
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {

      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_strategy = 'flex',
        layout_config = {
          preview_width = 0.618,
          horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = "top",
            width = 0.8
          },
          vertical = {
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.8
          }
        },
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    },
    keys = {
      { "<leader>ff", ":Telescope find_files<cr>",           mode = { "n" }, desc = "Find files" },
      { "<leader>fs", ":Telescope lsp_document_symbols<cr>", mode = { "n" }, desc = "Find symbols" },
      { "<leader>fw", ":Telescope live_grep<cr>",            mode = { "n" }, desc = "Live grep" },
      { "<leader>fb", ":Telescope buffers<cr>",              mode = { "n" }, desc = "Find buffers" },
      { "<leader>fo", ":Telescope oldfiles<cr>",             mode = { "n" }, desc = "Find oldfiles" },
    },
  },
}
