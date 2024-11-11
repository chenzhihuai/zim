local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map('n', "[b", ":BufferLineCyclePrev<CR>", opt) -- "Next buffer" },
map('n', "]b", ":BufferLineCycleNext<CR>", opt) -- "Next buffer" },

