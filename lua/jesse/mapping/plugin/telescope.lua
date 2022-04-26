-- Telescope Mappings
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
vim.keymap.set("n", "<leader>f", function()
  util.git_or_find_files()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>g", function()
  require("telescope.builtin").live_grep()
end, { noremap = true, silent = true })

return M
