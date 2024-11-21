require("basic.options")
require("basic.keymaps")
require("basic.autocmds")
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

require("basic.lazy")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end
