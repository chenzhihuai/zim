return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "clangd" })
			opts.servers = opts.servers or {}
			opts.servers.clangd = {
				capabilities = {
					offsetEncoding = { "utf-8", "utf-16" },
					textDocument = {
						completion = {
							editsNearCursor = true,
						},
					},
				},
			}
		end,
	},
}
