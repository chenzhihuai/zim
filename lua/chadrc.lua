local M = { }
M.base46={
  theme='aquarium',
   integrations = {"trouble"},
}
M.ui={
  statusline={
    enabled=true,
    theme='default',
    separator_style = "default",
  },
  telescope = { style = "bordered" }, -- borderless / bordered
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
  cmp = {
    lspkind_text = true,
    icons_left=true,
    style='atom'
  }
}
M.lsp={
  signature = true,
}
M.nvdash={
  load_on_startup=true,
}
return M
