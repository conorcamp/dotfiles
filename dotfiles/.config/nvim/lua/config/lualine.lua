
require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    icons_enabled = true,
    disabled_filetypes = {'netrw'},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = {
      {'diff', colored = false, separator = '', padding = { left = 1, right = 0 }},
      {'branch', icon = ''},
    },
    lualine_c = { {'filename'} },
    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location'  },
  },
  extensions = { 'fugitive' },
  tabline = {
  lualine_a = { {'buffers'} },
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
  }
}

