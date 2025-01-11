return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  enabled = false,
  config = function()
    -- dofile(vim.g.base46_cache .. "bufferline")
    local bufferline = require('bufferline')
    local get_theme_tb = require("base46").get_theme_tb
    local colors = get_theme_tb("base_30")
    bufferline.setup {
      highlights = {

        fill = {
          bg = colors.black2,
        },
        background = {
          bg = colors.black2,
        },
        tab = {
          bg = colors.black2,
        },
        tab_selected = {
          bg = colors.black,
        },
        tab_separator = {
          bg = colors.black2,
        },
        tab_separator_selected = {
          bg = colors.black,
          -- underline = '<colour-value-here>',
        },
        tab_close = {
          bg = colors.black2,
        },
        close_button = {
          bg = colors.black2,
        },
        close_button_visible = {
          bg = colors.black2,
        },
        close_button_selected = {
          bg = colors.black,
        },
        buffer_visible = {
          bg = colors.black2,
        },
        buffer_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        numbers = {
          bg = colors.black2,
        },
        numbers_visible = {
          bg = colors.black2,
        },
        numbers_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        diagnostic = {
          bg = colors.black2,
        },
        diagnostic_visible = {
          bg = colors.black2,
        },
        diagnostic_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        hint = {
          bg = colors.black2,
        },
        hint_visible = {
          bg = colors.black2,
        },
        hint_selected = {
          bg = colors.black2,
          bold = true,
          italic = true,
        },
        hint_diagnostic = {
          bg = colors.black2,
        },
        hint_diagnostic_visible = {
          bg = colors.black2,
        },
        hint_diagnostic_selected = {
          bg = colors.black2,
          bold = true,
          italic = true,
        },
        info = {
          bg = colors.black2,
        },
        info_visible = {
          bg = colors.black2,
        },
        info_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        info_diagnostic = {
          bg = colors.black2,
        },
        info_diagnostic_visible = {
          bg = colors.black2,
        },
        info_diagnostic_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        warning = {
          bg = colors.black2,
        },
        warning_visible = {
          bg = colors.black2,
        },
        warning_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        warning_diagnostic = {
          bg = colors.black2,
        },
        warning_diagnostic_visible = {
          bg = colors.black2,
        },
        warning_diagnostic_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        error = {
          bg = colors.black2,
        },
        error_visible = {
          bg = colors.black2,
        },
        error_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        error_diagnostic = {
          bg = colors.black2,
        },
        error_diagnostic_visible = {
          bg = colors.black2,
        },
        error_diagnostic_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        modified = {
          bg = colors.black2,
        },
        modified_visible = {
          bg = colors.black2,
        },
        modified_selected = {
          bg = colors.black,
        },
        duplicate_selected = {
          bg = colors.black,
          italic = true,
        },
        duplicate_visible = {
          bg = colors.black2,
          italic = true,
        },
        duplicate = {
          bg = colors.black2,
          italic = true,
        },
        separator_selected = {
          bg = colors.black,
        },
        separator_visible = {
          bg = colors.black2,
        },
        separator = {
          fg = colors.black2,
          bg = colors.black2,
        },
        indicator_visible = {
          bg = colors.black2,
        },
        indicator_selected = {
          fg = colors.cyan,
          bg = colors.black,
        },
        pick_selected = {
          bg = colors.black,
          bold = true,
          italic = true,
        },
        pick_visible = {
          bg = colors.black2,
          bold = true,
          italic = true,
        },
        pick = {
          bg = colors.black2,
          bold = true,
          italic = true,
        },
        offset_separator = {
          bg = colors.black2,
        },
        trunc_marker = {
          bg = colors.black2,
        }
      },
      options = {
        mode = "buffers",                               -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
        themable = true,
        numbers = "none",
        close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon' -- 'icon' | 'underline' | 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true,  -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false, -- only applies to coc
        diagnostics_update_on_event = true,   -- use nvim's diagnostic handler
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
          -- filter out filetypes you don't want to see
          if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            return true
          end
          -- filter out by buffer name
          if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            return true
          end
          -- filter out based on arbitrary rules
          -- e.g. filter out vim wiki buffer from tabline in your work repo
          if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            return true
          end
          -- filter out by it's index number in list (don't show first buffer)
          if buf_numbers[1] ~= buf_number then
            return true
          end
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = false
          }
        },
        color_icons = false, -- whether or not to add the filetype icon highlights
        -- get_element_icon = function(element)
        --   -- element consists of {filetype: string, path: string, extension: string, directory: string}
        --   -- This can be used to change how bufferline fetches the icon
        --   -- for an element e.g. a buffer or a tab.
        --   -- e.g.
        --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        --   return icon, hl
        --   -- or
        --   local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
        --   return custom_map[element.filetype]
        -- end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,    -- whether to show duplicate buffer prefix
        duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
        persist_buffer_sort = true,      -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false,      -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
        pick = {
          alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
        },
      }
    }
  end
}
