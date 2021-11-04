return {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
        diagnostics = {
          enable = true,
          globals = { 'vim', 'use', 'cmp', 'packer_plugins' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          -- Make the server aware of Neovim runtime files
          --library = {
          --  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          --  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          --},
        },
        telemetry = { enable = false },
      },
    },
}
