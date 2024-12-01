local function _config()
	vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

	-- 引入nvim-dap插件
	local dap = require("dap")

	-- Python调试配置
	dap.adapters.python = {
		type = "executable",
		-- command = "debugpy-adapter.cmd", -- it seem not work on windows
		-- args = {},
		command = "python",
		args = { "-m", "debugpy.adapter" }, -- TODO: pip install debugpy
	}

	-- 配置一个Python调试会话
	dap.configurations.python = {
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
end
return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = _config,
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Start | Continue",
			},
			{ "<F10>", require("dap").step_over, desc = "Debug: Step over" },
			{ "<F11>", require("dap").step_into, desc = "Debug: Step into" },
			{ "<F12>", require("dap").step_out, desc = "Debug: Step out" },
			{ "<F8>", require("dap").toggle_breakpoint, desc = "Debug: Toggle breakpoint" },
			{ "<F9>", require("dap").continue, desc = "Debug: Continue" },
		},
	},
	-- nvim-dap-ui 插件配置
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{
				"<F6>",
				function()
					require("dapui").open()
				end,
				desc = "Debug: Open UI",
			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dapui.setup({
				layouts = {
					{
						elements = {
							-- 调试窗口布局元素
							"scopes",
							"breakpoints",
							"stacks",
							"watches",
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							"repl",
						},
						size = 10,
						position = "bottom",
					},
				},
			})
		end,
	},

	-- nvim-dap-virtualtext 插件配置
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtualtext").setup({
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
				--- A callback that determines how a variable is displayed or whether it should be omitted
				--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
				--- @param buf number
				--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
				--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
				--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
				--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
				display_callback = function(variable, buf, stackframe, node, options)
					-- by default, strip out new line characters
					if options.virt_text_pos == "inline" then
						return " = " .. variable.value:gsub("%s+", " ")
					else
						return variable.name .. " = " .. variable.value:gsub("%s+", " ")
					end
				end,
				-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
				virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

				-- experimental features:
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			})
		end,
	},
}
