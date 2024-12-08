local uname = (vim.uv or vim.loop).os_uname()
local is_linux_arm = uname.sysname == "Linux" and (uname.machine == "aarch64" or vim.startswith(uname.machine, "arm"))

return {
	{
		"AstroNvim/astrolsp",
		optional = true,
		opts = function(_, opts)
			opts.config = vim.tbl_deep_extend("keep", opts.config, {
				clangd = {
					capabilities = {
						offsetEncoding = "utf-8",
					},
				},
			})
			if is_linux_arm then
				opts.servers = require("astrocore").list_insert_unique(opts.servers, { "clangd" })
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = function(_, opts)
			if opts.ensure_installed ~= "all" then
				opts.ensure_installed = require("astrocore").list_insert_unique(
					opts.ensure_installed,
					{ "cpp", "c", "objc", "cuda", "proto" }
				)
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		opts = function(_, opts)
			if not is_linux_arm then
				opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "clangd" })
			end
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		dependencies = {
			"AstroNvim/astrocore",
			opts = {
				autocmds = {
					clangd_extensions = {
						{
							event = "LspAttach",
							desc = "Load clangd_extensions with clangd",
							callback = function(args)
								if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
									require("clangd_extensions")
									vim.api.nvim_del_augroup_by_name("clangd_extensions")
								end
							end,
						},
					},
					clangd_extension_mappings = {
						{
							event = "LspAttach",
							desc = "Load clangd_extensions with clangd",
							callback = function(args)
								if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
									require("astrocore").set_mappings({
										n = {
											["<Leader>lw"] = {
												"<Cmd>ClangdSwitchSourceHeader<CR>",
												desc = "Switch source/header file",
											},
										},
									}, { buffer = args.buf })
								end
							end,
						},
					},
				},
			},
		},
	},
	{
		"Civitasv/cmake-tools.nvim",
		ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		dependencies = {
			"stevearc/overseer.nvim",
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = function(_, opts)
					opts.ensure_installed =
						require("astrocore").list_insert_unique(opts.ensure_installed, { "codelldb" })
				end,
			},
		},
		opts = {
			cmake_executor = { -- executor to use
				name = "overseer", -- name of the executor
				opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
				default_opts = { -- a list of default and possible values for executors
					quickfix = {
						show = "always", -- "always", "only_on_error"
						position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
						size = 10,
						encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
						auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
					},
					toggleterm = {
						direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
						close_on_exit = false, -- whether close the terminal when exit
						auto_scroll = true, -- whether auto scroll to the bottom
						singleton = true, -- single instance, autocloses the opened one, if present
					},
					overseer = {
						new_task_opts = {
							strategy = {
								"toggleterm",
								direction = "horizontal",
								autos_croll = true,
								quit_on_exit = "success",
							},
						}, -- options to pass into the `overseer.new_task` command
						on_new_task = function(task)
							require("overseer").open({ enter = false, direction = "right" })
						end, -- a function that gets overseer.Task when it is created, before calling `task:start`
					},
					terminal = {
						name = "Main Terminal",
						prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
						split_direction = "horizontal", -- "horizontal", "vertical"
						split_size = 11,

						-- Window handling
						single_terminal_per_instance = true, -- Single viewport, multiple windows
						single_terminal_per_tab = true, -- Single viewport per tab
						keep_terminal_static_location = true, -- Static location of the viewport if avialable
						auto_resize = true, -- Resize the terminal if it already exists

						-- Running Tasks
						start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
						focus = false, -- Focus on terminal when cmake task is launched.
						do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
					}, -- terminal executor uses the values in cmake_terminal
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = function(_, opts)
			local tools = { "codelldb" }
			if not is_linux_arm then
				table.insert(tools, "clangd")
			end
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, tools)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "server",
				port = "12345",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },

					-- On windows you may have to uncomment this:
					detached = false,
				},
			}
			-- see https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = "C:/cpptools-windows-x64/extension/debugAdapters/bin/OpenDebugAD7.exe",
				options = {
					detached = false,
				},
			}
			dap.configurations.cpp = {
				{
					name = "Debug chosen executable",
					type = "codelldb",
					-- type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					-- stopOnEntry = true,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,
	},
}
