return function()
  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'powerline_dark',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {
      lualine_c = {
        {
          "navic",
          color_correction = nil,
          navic_opts = nil
        },
      },
    },
    inactive_winbar = {},
    extensions = {}
  })

  vim.o.cursorline = true
  vim.o.background = "dark"
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#262626' })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = 'grey', bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#d7af00', bg = 'green' })
  vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })

  vim.api.nvim_set_hl(0, 'Visual', {
     bg = '#555555',
     blend = 30,
     underline = true,
  })
end 
