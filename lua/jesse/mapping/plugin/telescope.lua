-- Telescope Mappings
local builtin = require "telescope.builtin"
local util = require "jesse.core.util"

local M = {}

M.mappings = {
  i = {
    ["<C-v>"] = util.open_telescope_selection_in_new_instance,
  },
  n = {
    ["<C-v>"] = util.open_telescope_selection_in_new_instance,
  },
}

-- Launch mappings
-- Fallback to find_files if not in git repo
local git_or_find_files = function()
  local opts = {}
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

vim.keymap.set("n", "<leader>f", function()
  git_or_find_files()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>g", function()
  builtin.live_grep()
end, { noremap = true, silent = true })

return M
