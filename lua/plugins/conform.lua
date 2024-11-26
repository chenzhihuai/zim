return {
  'stevearc/conform.nvim',
  config = function()
    local opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback'
      }
    }
    require("conform").setup(opts)
  end
}
