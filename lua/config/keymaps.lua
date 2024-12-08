local map = vim.keymap.set

map("n", "Y", "y$")
map("i", "<c-backspace>", "<c-w>")
map("n", "H", "^")
map("n", "L", "$")
map("n", "j", "gj")
map("n", "k", "gk")
map("v", ">", ">gv")
map("v", "<", "<gv")
map({ "n", "v" }, "<leader><space>", ":")
