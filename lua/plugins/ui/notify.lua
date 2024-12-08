return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		vim.notify.setup({
			-- 设置通知位置相关参数
			render = "wrapped-compact",
			stages = "fade_in_slide_out",
			timeout = 3000,
			top_down = false,
		})
	end,
}
