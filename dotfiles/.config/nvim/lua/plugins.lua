local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local plug_url_format = ""
if vim.g.is_linux then
  plug_url_format = "https://hub.fastgit.org/%s"
else
  plug_url_format = "https://github.com/%s"
end

local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

require("packer").startup({
  function(use)
    use({"wbthomason/packer.nvim", opt = true})

    -- Git command inside vim
    use({ "tpope/vim-fugitive", event = "User InGitRepo" })


    -- treesitter highlighting
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      run = ':TSUpdate',
    }
    -- fallback syntax highlighting
    use 'sheerun/vim-polyglot'


    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'anott03/nvim-lspinstall'


    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      },
      --config = [[require('config.cmp')]],
      event = 'InsertEnter *',
    }

    use {
      'kdheepak/tabline.nvim',
      config = function()
        require'tabline'.setup {enable = false}
      end,
      requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = [[require('config.lualine')]],
    }


    -- tmux navigation
    use { 'alexghergh/nvim-tmux-navigation', config = function()
      vim.api.nvim_set_keymap('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
    end
    }

    -- Colorscheme
    use 'ishan9299/nvim-solarized-lua'

    -- git gutter
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup {
          signs = {
            add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
            change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
            topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
            changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          },
        }
      end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        vim.opt.termguicolors = true
        vim.cmd [[highlight IndentBlanklineIndent1 guifg=#073642 gui=nocombine]]
        require("indent_blankline").setup {
          space_char_blankline = " ",
          char_highlight_list = {'IndentBlanklineIndent1'},
          show_current_context = true,
        }
      end
    }

  end,
  config = {
    max_jobs = 16,
    git = {
      default_url_format = plug_url_format,
    },
  },
})
