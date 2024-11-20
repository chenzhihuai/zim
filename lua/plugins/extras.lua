return {
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
}
