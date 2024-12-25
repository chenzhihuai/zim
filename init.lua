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
