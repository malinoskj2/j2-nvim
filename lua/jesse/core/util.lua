-- Utils

local builtin = require "telescope.builtin"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

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
M.open_nvim_instance = function(file_path)
  local command = "silent exec '!alacritty -e $SHELL -c \"$EDITOR " .. file_path .. "\" &'"
  vim.cmd(command)
end

-- Telescope

-- Fallback to find_files if not in git repo
M.git_or_find_files = function()
  local opts = {}
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

M.get_telescope_selected_file_path = function(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local cwd = current_picker.cwd
  local seleted_entry = action_state.get_selected_entry()

  return cwd .. "/" .. seleted_entry[1]
end

M.open_telescope_selection_in_new_instance = function(prompt_bufnr)
  local path = M.get_telescope_selected_file_path(prompt_bufnr)
  M.open_nvim_instance(path)
  actions.close(prompt_bufnr)
end

return M
