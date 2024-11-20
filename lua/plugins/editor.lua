return {
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

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
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
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
    opts = {
      keymaps = {
        -- map keys to a command
        -- { '<leader>ff', ':Telescope find_files', description = 'Find files' },
        { 'K',          vim.lsp.buf.hover,           description = 'Open an LSP hover window above cursor' },
        { '<leader>rn', vim.lsp.buf.rename,          description = 'Rename the symbol below the cursor' },
        { '<leader>ca', vim.lsp.buf.code_action,     description = 'Open a code action selection prompt' },
        { ']e',         vim.diagnostic.goto_next,    description = 'Go to the next diagnostic' },
        { '[e',         vim.diagnostic.goto_prev,    description = 'Go to the previous diagnostic' },
        { 'gd',         vim.lsp.buf.definition,      description = 'Open the definition' },
        { 'gt',         vim.lsp.buf.type_definition, description = 'Open the type definition' },
        { 'gD',         vim.lsp.buf.declaration,     description = 'Open the declaration' },
        { 'gr',         vim.lsp.buf.references,      description = 'Open the reference' },
        { 'gi',         vim.lsp.buf.implementation,  description = 'Open the implementation' },
        { '<leader>h',  vim.lsp.buf.signature_help,  description = 'Open the implementation' },
        { '<leader>tf',  description = 'Open float terminal' },
        { '<leader>tb',  description = 'Open bottom terminal' },
      },
      commands = {
        -- easily create user commands
        {'Format', vim.lsp.buf.format, description = 'Format whole buffer' },
        {'Neotree', description="File Explorer" },
        {'Neogit', description='Interactive Git Interface' },
      },
      funcs = {
        -- Make arbitrary Lua functions that can be executed via the item finder
        -- { vim.lsp.buf.definition, description = 'goto definition' },
        -- { vim.lsp.buf.references, description = 'goto references' },
        -- { vim.lsp.buf.rename, description = 'rename symbol' },
      },
      autocmds = {
        -- Create autocmds and augroups
        -- { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
        {
          name = 'MyAugroup',
          clear = true,
          -- autocmds here
        },
      },
      -- load extensions
      extensions = {
        -- automatically load keymaps from lazy.nvim's `keys` option
        lazy_nvim = true,
        -- load keymaps and commands from nvim-tree.lua
        nvim_tree = true,
        -- load commands from smart-splits.nvim
        -- and create keymaps, see :h legendary-extensions-smart-splits.nvim
        smart_splits = {
          directions = { 'h', 'j', 'k', 'l' },
          mods = {
            move = '<C>',
            resize = '<M>',
          },
        },
        -- load commands from op.nvim
        -- op_nvim = true,
        -- load keymaps from diffview.nvim
        diffview = true,
      },
      sort = {
        -- put most recently selected item first, this works
        -- both within global and item group lists
        most_recent_first = true,
        -- sort user-defined items before built-in items
        user_items_first = true,
        -- sort the specified item type before other item types,
        -- value must be one of: 'keymap', 'command', 'autocmd', 'group', nil
        item_type_bias = nil,
        -- settings for frecency sorting.
        -- https://en.wikipedia.org/wiki/Frecency
        -- Set `frecency = false` to disable.
        -- this feature requires sqlite.lua (https://github.com/kkharji/sqlite.lua)
        -- and will be automatically disabled if sqlite is not available.
        -- NOTE: THIS TAKES PRECEDENCE OVER OTHER SORT OPTIONS!
        -- frecency = {
          -- 	-- the directory to store the database in
          -- 	db_root = string.format('%s/legendary/', vim.fn.stdpath('data')),
          -- 	-- the maximum number of timestamps for a single item
          -- 	-- to store in the database
          -- 	max_timestamps = 10,
          -- },
        },
      }
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
      config= function()
        local get_theme_tb = require('base46').get_theme_tb
        local colors = get_theme_tb "base_30"
        -- local colors=require "base46.colors"
        vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator',{fg=colors.darker_black, bg=colors.darker_black})
        vim.api.nvim_set_hl(0, 'NeoTreeNormal',{bg=colors.darker_black})
        vim.api.nvim_set_hl(0, 'NeoTreeNormalNC',{bg=colors.darker_black})
      end
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
      opts={
        integrations = {
          diffview = true,
        }
      }
    },
    { "lewis6991/gitsigns.nvim", opts = {} },
    -- task runner
    { 'stevearc/overseer.nvim', opts = {}, },
    -- fold
    {
      'kevinhwang91/nvim-ufo',
      dependencies={'kevinhwang91/promise-async'} ,
      config=function() 
        local handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (' 󰁂 %d '):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, {chunkText, hlGroup})
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              -- str width returned from truncate() may less than 2nd argument, need padding
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, {suffix, 'MoreMsg'})
          return newVirtText
        end

        -- global handler
        -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
        -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
        require('ufo').setup({
          fold_virt_text_handler = handler
        })
      end
    },
  }
