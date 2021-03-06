local lsp_installer = require('nvim-lsp-installer')
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local utils = require('utils')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(
    'n',
    '<space>wa',
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<space>wr',
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<space>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    opts
  )
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>I', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local function install_servers(servers)
  for _, server_name in pairs(servers) do
    local ok, server = lsp_installer_servers.get_server(server_name)
    if ok then
      if not server:is_installed() then
        server:install()
      end
    end
  end
end

local function setup_servers(servers, default_opts)
  -- Setup all servers installed via nvim-lsp-installer
  lsp_installer.on_server_ready(function(server)
    local opts = vim.tbl_deep_extend("force", default_opts, servers[server.name] or {})
    --local opts = utils.merge_tables(setups[server.name] or {}, default_opts)
    server:setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
  end)

  install_servers(servers)
end

local lsp_default_opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

local servers = {
  efm = require('lsp.efm'),
  sumneko_lua = require('lsp.lua'),
  graphql = {},
  pyright = {},
  bashls = {},
  dockerls = {},
  jsonls = {},
}

setup_servers(servers, lsp_default_opts)
