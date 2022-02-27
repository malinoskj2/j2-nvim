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

M.hide_status_line = function()
  local current_type = vim.api.nvim_buf_get_option(0, "ft")
  local hidden = { "help", "dashboard", "NvimTree", "terminal" }

  if vim.tbl_contains(hidden, current_type) then
    vim.api.nvim_set_option("laststatus", 0)
  else
    vim.api.nvim_set_option("laststatus", 2)
  end
end

M.open_nvim_instance = function()
  vim.cmd "silent exec '!alacritty -e $SHELL -c $EDITOR'"
end

return M
