local M = {}
M.base46 = {
  theme = "aquarium",
}
M.ui = {
  statusline = {
    enabled = true,
    theme = "default",
    -- separator_style = "arrow",
    separator_style = "default",
  },
  telescope = { style = "borderless" }, -- borderless / bordered
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
  cmp = {
    lspkind_text = true,
    icons_left = true,
    style = "atom",
  },
}
M.lsp = {
  signature = true,
}
M.nvdash = {
  load_on_startup = true,
}
M.term = {
  winopts = { number = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    row = 0.15,
    col = 0.15,
    width = 0.7,
    height = 0.7,
    border = "rounded",
  },
}
return M
