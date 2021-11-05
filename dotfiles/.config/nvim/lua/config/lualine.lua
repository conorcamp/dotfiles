local colors = {
  base03 = '#002b36',
  base02 = '#073642',
  base01 = '#586e75',
  base00 = '#657b83',
  base0 = '#839496',
  base1 = '#93a1a1',
  base2 = '#eee8d5',
  base3 = '#fdf6e3',
  yellow = '#b58900',
  orange = '#cb4b16',
  red = '#dc322f',
  magenta = '#d33682',
  violet = '#6c71c4',
  blue = '#268bd2',
  cyan = '#2aa198',
  green = '#859900',
}

local modified_solarized = {
  normal = {
    a = { fg = colors.base3, bg = colors.base1, gui = 'bold' },
    b = { fg = colors.base3, bg = colors.base00 },
    c = { fg = colors.base00, bg = colors.base02 },
  },
  --insert = {
  --  a = { fg = colors.base3, bg = colors.base1, gui = 'bold' },
  --  b = { fg = colors.base3, bg = colors.base2 },
  --  c = { fg = colors.base2, bg = colors.base02 },
  --},
  --visual = { a = { fg = colors.base03, bg = colors.magenta, gui = 'bold' } },
  --replace = { a = { fg = colors.base03, bg = colors.red, gui = 'bold' } },
  --inactive = {
  --  a = { fg = colors.base0, bg = colors.base02, gui = 'bold' },
  --  b = { fg = colors.base03, bg = colors.base00 },
  --  --c = { fg = colors.base01, bg = colors.base02 },
  --  c = { fg = colors.yellow, bg = colors.violet },
  --},
}

require('lualine').setup({
  options = {
    icons_enabled = true,
    --theme = 'solarized_dark',
    theme = modified_solarized,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'netrw' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { { 'mode', upper = true } },
    lualine_b = {
      { 'diff', colored = false, separator = '', padding = { left = 1, right = 0 } },
      { 'branch', icon = '' },
    },
    lualine_c = { { 'filename' } },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
      'encoding',
      'filetype',
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' },
  },
  extensions = { 'fugitive' },
  tabline = {
    lualine_a = {
      {
        'buffers',
        buffers_color = {
          active = { fg = colors.base3, bg = colors.base1 },
          inactive = { fg = colors.base00, bg = colors.base02 },
        },
      },
    },
  },

})
