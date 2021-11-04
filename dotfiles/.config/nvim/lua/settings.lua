-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
--local exec = vim.api.nvim_exec -- execute Vimscript
--local fn = vim.fn -- call Vim functions
local cmd = vim.cmd -- execute Vim commands
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' ' -- change leader to a comma
opt.mouse = 'a' -- enable mouse support
opt.swapfile = false -- don't use swapfile

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors
opt.background = 'dark'
vim.cmd('colorscheme solarized-flat')
--vim.cmd('colorscheme solarized')
--vim.cmd('colorscheme NeoSolarized')
--vim.cmd('colorscheme solarized8')

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber = true -- show relative line number
opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.wrap = false -- don't wrap lines
opt.linebreak = true -- wrap on word boundary
opt.cursorline = true -- highlight cursor line
opt.showmode = false -- remove mode info from statusline
opt.shortmess:append('sI') -- disable nvim intro
--opt.textwidth = 500           -- wrap at 500 chars

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end

-- python
g.python3_host_prog = '/Users/conor_camp/.pyenv/versions/py3nvim/bin/python'
g.python_host_prog = '/Users/conor_camp/.pyenv/versions/py2nvim/bin/python'
--g.loaded_python_provider = 0 --disable python2 support (small improvement to startup time)
