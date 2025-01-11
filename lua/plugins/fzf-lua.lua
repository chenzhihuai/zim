return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    fzf_colors = {
      true, -- inherit fzf colors that aren't specified below from
      -- the auto-generated theme similar to `fzf_colors=true`
      ["fg"]      = { "fg", "CursorLine" },
      ["bg"]      = { "bg", "Normal" },
      ["hl"]      = { "fg", "Comment" },
      ["fg+"]     = { "fg", "Normal", "underline" },
      ["bg+"]     = { "bg", { "CursorLine", "Normal" } },
      ["hl+"]     = { "fg", "Statement" },
      ["info"]    = { "fg", "PreProc" },
      ["prompt"]  = { "fg", "Conditional" },
      ["pointer"] = { "fg", "Exception" },
      ["marker"]  = { "fg", "Keyword" },
      ["spinner"] = { "fg", "Label" },
      ["header"]  = { "fg", "Comment" },
      ["gutter"]  = "-1",
    },
  }
}
