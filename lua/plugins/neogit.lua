return {
      "NeogitOrg/neogit",
      keys = { { "<leader>gg", "<cmd>Neogit<cr>", "Interactive git interface" } },
      dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
      },
      opts={
        integrations = {
          diffview = true,
        }
      }
    }
