return {
	"ms-jpq/coq_nvim",
	enabled = false,
	branch = "coq",
	event = "InsertEnter",
	build = ":COQdeps",
	cmd = { "COQnow", "COQhelp", "COQstats", "COQdeps" },
	dependencies = {
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		{
			"AstroNvim/astrocore",
			opts = {
				options = {
					g = {
						coq_settings = {
							display = { ghost_text = { enabled = false } },
							auto_start = "shut-up",
							keymap = {
								jump_to_mark = "<Tab>",
								recommended = true,
								pre_select = true,
							},
						},
					},
				},
			},
		},
		{
			"AstroNvim/astrolsp",
			optional = true,
			opts = {
				capabilities = {
					textDocument = {
						completion = {
							completionItem = {
								deprecatedSupport = true,
								insertReplaceSupport = true,
								insertTextModeSupport = { valueSet = { 1, 2 } },
								labelDetailsSupport = true,
								preselectSupport = true,
								resolveSupport = { properties = {} },
								snippetSupport = true,
								tagSupport = { valueSet = { 1 } },
							},
						},
					},
				},
			},
		},
	},
}
