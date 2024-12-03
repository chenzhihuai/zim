return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "pylsp" })
			opts.servers = opts.servers or {}
			opts.servers.pylsp = {} -- default
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "debugpy" })
			opts.adapters = opts.adapters or {}
			opts.configurations = opts.configurations or {}

			-- Python调试配置
			opts.adapters.python = {
				type = "executable",
				-- command = "debugpy-adapter.cmd", -- it seem not work on windows
				-- args = {},
				command = "python",
				args = { "-m", "debugpy.adapter" }, -- TODO: pip install debugpy
			}

			-- 配置一个Python调试会话
			opts.configurations.python = {
				{
					name = "Python: Debug",
					type = "python",
					request = "launch",
					program = "${file}", -- 当前打开的文件作为要调试的程序
					pythonPath = function()
						-- 返回你实际的Python可执行文件路径，这里假设你已经设置了正确的环境变量
						return vim.fn.exepath("python")
					end,
				},
			}
		end,
	},
}
