return {
  -- "onsails/lspkind.nvim",
	-- lsp ui
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			-- 'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},
	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		config = require('config.cmp'),
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
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			'saadparwaiz1/cmp_luasnip'
		},
	},

	{ "williamboman/mason.nvim", opts = true },

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
      dofile(vim.g.base46_cache .. "trouble")
      require("trouble").setup()
    end
  },
}
