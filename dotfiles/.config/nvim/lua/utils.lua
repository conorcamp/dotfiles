local cmd = vim.cmd

local M = {}

function M.executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end

  return false
end

function M.autocmd(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = {cmds} end
  cmd('augroup ' .. group)
  if clear then cmd [[au!]] end
  for _, c in ipairs(cmds) do cmd('autocmd ' .. c) end
  cmd [[augroup END]]
end

function M.merge_tables(t1, t2)
    local output = {}
    local function _mt(_t1, _t2)
        for k, v in pairs(_t2) do _t1[k] = v end
        return _t1
    end
    output = _mt(output, t1)
    output = _mt(output, t2)
    return output
end

return M

