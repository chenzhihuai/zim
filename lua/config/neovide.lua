-- vim.o.guifont = "Maple Mono NF CN:h10"
vim.o.guifont = "IntoneMono NFM:h10"

vim.g.neovide_title_background_color = string.format(
  "%x",
  vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg
)

vim.g.neovide_title_text_color = "pink"


vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5


vim.g.neovide_floating_corner_radius = 0.5


vim.g.neovide_show_border = false


vim.g.neovide_theme = 'dark'


local function set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = set_ime
})



vim.g.neovide_cursor_animate_command_line = false

vim.g.neovide_cursor_smooth_blink = true

vim.g.neovide_underline_stroke_scale = 2.0

vim.opt.linespace = -1
