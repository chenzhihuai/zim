local M = { }
M.base46={
  theme='onedark',
}
M.ui={

  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
  cmp = {
    icons_left=true
  }
}
return M
