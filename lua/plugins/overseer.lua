return {
	"stevearc/overseer.nvim",
	dependencies = {
		{
			"rcarriga/nvim-notify",
			opts = {},
		},
	},
	keys = {
		{ "<Leader>ot", "<cmd>OverseerToggle<cr>", "Toggle overseer task list" },
		{ "<Leader>or", "<cmd>OverseerRun<cr>", "List overseer run templates" },
	},
	config = function()
		local overseer = require("overseer")
		overseer.setup({
			dap = true,
			templates = {
				"builtin",
				"user.run_python",
				"user.run_script",
				"user.build_cpp",
				"user.run_cpp",
				"user.build_cpp_debug",
			},
			task_list = {
				direction = "right",
				bindings = {
					["<C-u>"] = false,
					["<C-d>"] = false,
					["<C-h>"] = false,
					["<C-j>"] = false,
					["<C-k>"] = false,
					["<C-l>"] = false,
				},
			},
			notification_handler = function(task)
				if task.status == "success" then
					vim.notify("Task completed successfully: " .. task.name, vim.log.levels.INFO)
				elseif task.status == "failure" then
					vim.notify("Task failed: " .. task.name, vim.log.levels.ERROR)
				end
			end,
		})
		-- custom behavior of make templates
		overseer.add_template_hook({
			module = "^make$",
		}, function(task_defn, util)
			util.add_component(task_defn, { "on_output_quickfix", open_on_exit = "failure" })
			util.add_component(task_defn, "on_complete_notify")
			util.add_component(task_defn, { "display_duration", detail_level = 1 })
		end)
	end,
}
