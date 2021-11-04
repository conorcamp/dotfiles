local refactor_config = {
  highlight_current_scope = {
    enable = false,
  },
  smart_rename = {
    enable = true,
    keymaps = {
      smart_rename = "grr",
    },
  },
  navigation = {
    enable = true,
    keymaps = {
      goto_definition = "gnd",
      list_definitions = "gnD",
      list_definitions_toc = "gO",
      goto_next_usage = "<a-*>",
      goto_previous_usage = "<a-#>",
    },
  }
}

local textobjects_config = {
  lsp_interop = {
    enable = true,
    border = 'none',
    peek_definition_code = {
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
  select = {
    enable = true,
    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },
}


require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "graphql",
    "java",
    "json",
    "json5",
    "lua",
    "python",
    "regex",
    "scala",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = textobjects_config,
  refactor = refactor_config,
})
