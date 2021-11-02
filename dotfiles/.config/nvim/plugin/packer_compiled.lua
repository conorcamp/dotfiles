-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/conor_camp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/conor_camp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/conor_camp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/conor_camp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/conor_camp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    after_files = { "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config.lualine')" },
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-path", "cmp-buffer", "cmp-nvim-lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-solarized-lua"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-solarized-lua"
  },
  ["nvim-tmux-navigation"] = {
    config = { "\27LJ\2\nþ\5\0\0\6\0\22\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2B:lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>\14<C-Space>\1\0\2\fnoremap\2\vsilent\2H:lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>\n<C-\\>\1\0\2\fnoremap\2\vsilent\2C:lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>\n<C-l>\1\0\2\fnoremap\2\vsilent\2@:lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>\n<C-k>\1\0\2\fnoremap\2\vsilent\2B:lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>\n<C-j>\1\0\2\fnoremap\2\vsilent\2B:lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>\n<C-h>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-tmux-navigation"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["vim-fugitive"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/conor_camp/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tmux-navigation
time([[Config for nvim-tmux-navigation]], true)
try_loadstring("\27LJ\2\nþ\5\0\0\6\0\22\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2B:lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>\14<C-Space>\1\0\2\fnoremap\2\vsilent\2H:lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>\n<C-\\>\1\0\2\fnoremap\2\vsilent\2C:lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>\n<C-l>\1\0\2\fnoremap\2\vsilent\2@:lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>\n<C-k>\1\0\2\fnoremap\2\vsilent\2B:lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>\n<C-j>\1\0\2\fnoremap\2\vsilent\2B:lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>\n<C-h>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-tmux-navigation")
time([[Config for nvim-tmux-navigation]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config.lualine')
time([[Config for lualine.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User InGitRepo ++once lua require("packer.load")({'vim-fugitive'}, { event = "User InGitRepo" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
