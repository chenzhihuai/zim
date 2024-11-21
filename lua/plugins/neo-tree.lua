return {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      keys = { { "<leader>e", "<cmd>Neotree<cr>", "Explorer" } },
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      config= function()
        local get_theme_tb = require('base46').get_theme_tb
        local colors = get_theme_tb "base_30"
        -- local colors=require "base46.colors"
        vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator',{fg=colors.darker_black, bg=colors.darker_black})
        vim.api.nvim_set_hl(0, 'NeoTreeNormal',{bg=colors.darker_black})
        vim.api.nvim_set_hl(0, 'NeoTreeNormalNC',{bg=colors.darker_black})
      end
    }
