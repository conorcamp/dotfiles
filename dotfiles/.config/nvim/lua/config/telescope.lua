local telescope = require 'telescope'
telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
  },
  extensions = {
    frecency = {
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      workspaces = {
        ["repos"]    = "/Users/conor_camp/airbnb",
        ["of-api"]   = "/Users/conor_camp/airlab/repos/oneflow/projects/oneflow-api",
        ["of-cli"]   = "/Users/conor_camp/airlab/repos/oneflow/projects/oneflow-cli",
        ["data-repo"]   = "/Users/conor_camp/airbnb/data",
      },
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  pickers = {
    git_files = {
        theme = 'dropdown',
    },
    find_files = {
        theme = 'dropdown',
    },
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      sort_lastused = true,
    },
  },
}

-- Extensions
telescope.load_extension 'fzf'
