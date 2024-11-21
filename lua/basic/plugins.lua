return {
  -- coding
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			'hrsh7th/cmp-nvim-lua',
			{
				'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippts" },
      },
      'saadparwaiz1/cmp_luasnip'
    },
    config= require "config.nvim-cmp"  
  },
  {
    'numToStr/Comment.nvim',
    opts = {}
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts={}
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts={}
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
      {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},
      {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},
      {"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
      {"<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},
      {"<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
      {"<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
      {"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
    },
  },
  -- editor
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
    opts = require "config.legendary"
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
      config= require "config.nvim-ufo"
    },
  -- extras
    { 'ahmedkhalf/project.nvim', config=function() require("project_nvim").setup { } end },
    -- jump
    {
      'folke/flash.nvim',
      keys = {
        { 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Jump forwards', },
        { 'S', function() require('flash').jump({ search = { forward = false } }) end, mode = { 'n', 'x', 'o' }, desc = 'Jump backwards', },
      },
    },
    -- search and replace whole project
    {
      'MagicDuck/grug-far.nvim',
      config = function()
        require('grug-far').setup({
          -- options, see Configuration section below
          -- there are no required options atm
          -- engine = 'ripgrep' is default, but 'astgrep' can be specified
        });
      end
    },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- }
  -- lsp
	{ "williamboman/mason.nvim", opts = {}},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" }
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/nvim-cmp" },
    config = require("config.lspconfig")

  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end
  },
  -- ui
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
    config = require("config.incline"),
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

