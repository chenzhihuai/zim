require("config.options")
require("config.keymaps")
require("config.autocmds")
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

require("config.commands")
require("config.lazy")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

if vim.g.neovide then
  require('config.neovide')
end


-- local get_theme_tb = require("base46").get_theme_tb
-- local colors = get_theme_tb("base_30")
-- vim.api.nvim_set_hl(0, "TbBufOn", {
--   fg = 'black',    -- foreground color (red)
--   bg = '#BCCAEB',  -- background color (black)
--   bold = true      -- make it bold (you can set other attributes as needed like italic etc.)
-- })
-- vim.api.nvim_set_hl(0, "TbBufOnClose", {
--   fg = 'black',   -- foreground color (red)
--   bg = '#BCCAEB', -- background color (black)
--   bold = true     -- make it bold (you can set other attributes as needed like italic etc.)
-- })
