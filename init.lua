require("options")
require("keymaps")
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

require("config.lazy")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end
