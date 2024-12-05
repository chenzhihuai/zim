local map = vim.keymap.set

map("n", "Y", "y$")
map("n", "<c-backspace>", "<c-w>")
map("n", "gh", "^")
map("n", "H", "^")
map("n", "gl", "$")
map("n", "L", "$")
map("n", "j", "gj")
map("n", "k", "gk")
map("x", ">", ">gv")
map("x", "<", "<gv")
map("i", "<backspace>", "<c-w>")
map({ "n", "v" }, "<leader><space>", ":")
