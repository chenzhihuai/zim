-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
	name = "build c++ (debug)",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		return {
			name = vim.fn.expand("%:t"),
			cmd = { "g++" },
			args = { "-g", file },
			cwd = vim.fn.expand("%:p:h"),
			components = { { "on_output_quickfix", open = false }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
