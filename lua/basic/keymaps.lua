local map = vim.keymap.set

map('n', 'Y', 'y$')
map('n', '<c-backspace>', '<c-w>')
map('n', 'gh', '^')
map('n', 'gl', '$')
map({'n','v'}, '<leader><space>', ':')
