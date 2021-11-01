local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- move on soft lines in insert mode
map {'i', '<Down>', '<C-o>g<Down>'}
map {'i', '<Up>', '<C-o>g<Up>'}

-- copy to system clipboard
map {'v', '<Leader>y', 'system("pbcopy", getreg("\""))<CR>'}

-- paste form system clipboard
map {'n', '<Leader>p', ':call setreg("\"",system("pbpaste"))<CR>p'}
map {'n', '<Leader>P', ':call setreg("\"",system("pbpaste"))<CR>P'}

-- window sizing
map {'n', '<C-Up>', ':call Resize("+")<CR>'}
map {'n', '<C-Down>', ':call Resize("-")<CR>'}
map {'n', '<C-left>', ':call Resize("<")<CR>'}
map {'n', '<C-Right>', ':call Resize(">")<CR>'}

-- return to remove last search highlighting
map {'n', '<CR>', ':noh<CR><CR>', noremap = false}

-- 0 to first nonblank char of line
-- ^ to hard beginning of line
map {'n', '0', '^'}
map {'n', '^', '0'}

-- buffer navigation
map {'n', '<S-l>', ':bnext<CR>'}
map {'n', '<S-h>', ':bprevious<CR>'}

-- open netrw
map {'n', '<leader>e', ':Explore<cr>'}

-- close buffer
map {'n', '<leader>d', ':bp|bd #<CR>', silent = true}
map {'n', '<leader>D', ':bp|bd! #<CR>', silent = true}
