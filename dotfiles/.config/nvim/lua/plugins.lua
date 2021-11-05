local fn = vim.fn

vim.g.package_home = fn.stdpath('data') .. '/site/pack/packer/'
local packer_install_dir = vim.g.package_home .. '/opt/packer.nvim'

local plug_url_format = ''
if vim.g.is_linux then
  plug_url_format = 'https://hub.fastgit.org/%s'
else
  plug_url_format = 'https://github.com/%s'
end

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format(
  '10split |term git clone --depth=1 %s %s',
  packer_repo,
  packer_install_dir
)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == '' then
  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd('packadd packer.nvim')

require('packer').startup({
  function(use)
    use({ 'wbthomason/packer.nvim', opt = true })

    -- lsp
    use({
      'neovim/nvim-lspconfig',
      config = function()
        require('config.lsp')
        return {}
      end,
      requires = {
        'williamboman/nvim-lsp-installer',
        'onsails/lspkind-nvim',
        'folke/lsp-colors.nvim',
      },
    })

    use({
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = [[require('config.trouble')]],
    })

    -- treesitter highlighting
    use({
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      run = ':TSUpdate',
      config = [[require('config.treesitter')]],
    })
    -- fallback syntax highlighting
    --use 'sheerun/vim-polyglot'

    -- Git
    use({
      {
        'tpope/vim-fugitive',
        cmd = {
          'Git',
          'Gstatus',
          'Gblame',
          'Gpush',
          'Gpull',
          'Gwrite',
          'Gcommit',
          'G*',
        },
        config = [[require('config.vim-fugitive')]],
        requires = {'tpope/vim-rhubarb'},
      },
      {
        'lewis6991/gitsigns.nvim', --git gutter
        requires = {
          'nvim-lua/plenary.nvim',
        },
        config = function()
          require('gitsigns').setup({
            signs = {
              add = {
                hl = 'GitSignsAdd',
                text = '+',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn',
              },
              change = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
              },
              delete = {
                hl = 'GitSignsDelete',
                text = '-',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
              },
              topdelete = {
                hl = 'GitSignsDelete',
                text = '‾',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
              },
              changedelete = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
              },
            },
          })
        end,
      },
    })

    -- Completion
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      },
      config = [[require('config.nvim-cmp')]],
      after = 'lspkind-nvim',
      --event = 'InsertEnter *',
    })

    use({
      'kdheepak/tabline.nvim',
      config = function()
        require('tabline').setup({ enable = false })
      end,
      requires = { 'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons' },
    })

    use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = [[require('config.lualine')]],
    })

    -- tmux navigation
    use({
      'alexghergh/nvim-tmux-navigation',
      config = function()
        vim.api.nvim_set_keymap(
          'n',
          '<C-h>',
          ':lua require\'nvim-tmux-navigation\'.NvimTmuxNavigateLeft()<cr>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<C-j>',
          ':lua require\'nvim-tmux-navigation\'.NvimTmuxNavigateDown()<cr>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<C-k>',
          ':lua require\'nvim-tmux-navigation\'.NvimTmuxNavigateUp()<cr>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<C-l>',
          ':lua require\'nvim-tmux-navigation\'.NvimTmuxNavigateRight()<cr>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<C-\\>',
          ':lua require\'nvim-tmux-navigation\'.NvimTmuxNavigateLastActive()<cr>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n',
          '<C-Space>',
          ':lua require\'nvim-tmux-navigation\'.NvimTmuxNavigateNext()<cr>',
          { noremap = true, silent = true }
        )
      end,
    })

    -- Colorscheme
    use({
      'ishan9299/nvim-solarized-lua',
      config = function()
        --vim.cmd([[highlight TSParameter guifg=#839496 guibg=NONE gui=NONE cterm=NONE]])
        --vim.cmd([[highlight TSVariable guifg=#839496 guibg=NONE gui=NONE cterm=NONE]])
        --vim.cmd(
        --  [[highlight TSVariableBuiltin guifg=#839496 guibg=NONE gui=NONE cterm=NONE]]
        --)
        --vim.cmd(
        --  [[highlight TSPunctBracket guifg=#839496 guibg=NONE gui=NONE cterm=NONE]]
        --)
        --vim.cmd(
        --  [[highlight TSPunctDelimiter guifg=#839496 guibg=NONE gui=NONE cterm=NONE]]
        --)
      end,
    })
    use('chumakd/NeoSolarized')
    use('lifepillar/vim-solarized8')

    use({
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.opt.termguicolors = true
        vim.cmd([[highlight IndentBlanklineIndent1 guifg=#073642 gui=nocombine]])
        require('indent_blankline').setup({
          space_char_blankline = ' ',
          char_highlight_list = { 'IndentBlanklineIndent1' },
          show_current_context = true,
        })
      end,
    })
    use({
      {
        'nvim-telescope/telescope.nvim',
        requires = {
          'nvim-lua/popup.nvim',
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope-frecency.nvim',
          'nvim-telescope/telescope-fzf-native.nvim',
        },
        setup = [[require('config.telescope_setup')]],
        config = [[require('config.telescope')]],
        cmd = 'Telescope',
        module = 'telescope',
      },
      {
        'nvim-telescope/telescope-frecency.nvim',
        after = 'telescope.nvim',
        config = function()
          require('telescope').load_extension('frecency')
        end,
        requires = 'tami5/sqlite.lua',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    })
  end,
  config = {
    max_jobs = 16,
    git = {
      default_url_format = plug_url_format,
    },
  },
})
