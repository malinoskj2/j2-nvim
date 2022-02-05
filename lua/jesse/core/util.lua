-- Misc utility functions
local M = {}

-- taken from https://www.reddit.com/r/neovim/comments/skkwnd/comment/hvlwo91
M.close_all_floating_windows = function()
  local closed_windows = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then -- is_floating_window?
      vim.api.nvim_win_close(win, false) -- do not force
      table.insert(closed_windows, win)
    end
  end
end

M.close_all = function()
  vim.cmd "cclose"
  vim.cmd "NvimTreeClose"
  vim.cmd "normal q"
  M.close_all_floating_windows()
end

return M
