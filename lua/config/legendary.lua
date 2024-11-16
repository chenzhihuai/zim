return {
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
  },
  commands = {
    -- easily create user commands
    {'Format', vim.lsp.buf.format, description = 'Format whole buffer' },
		{'Neotree', description="File Explorer" },
		{'Neogit', description='Interactive Git Interface' },
    {'ToggleTerm', description = 'Open term in bottom' },
    {'ToggleTerm direction=float', description = 'Open term in float' },
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
