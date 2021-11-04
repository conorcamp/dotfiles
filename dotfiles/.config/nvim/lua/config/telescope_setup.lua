local map_key = vim.api.nvim_set_keymap

local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then modes = {modes} end
  for _, mode in ipairs(modes) do map_key(mode, lhs, rhs, opts) end
end

local silent = { silent = true }
--
-- Navigate buffers and repos
map('n', '<leader>ff',[[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>fg', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
map('n', '<leader>fb', [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map('n', '<leader>fF', [[<cmd>Telescope find_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>fh', [[<cmd>Telescope help_tags theme=get_dropdown<cr>]], silent)
map('n', '<leader>fi', [[<cmd>Telescope frecency theme=get_dropdown<cr>]], silent)
map('n', '<leader>ft', [[<cmd>Telescope treesitter theme=get_dropdown<cr>]], silent)
