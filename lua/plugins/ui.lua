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
}