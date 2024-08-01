-- Telescope Mappings
local util = require "jesse.core.util"

-- Launch mappings
vim.keymap.set("n", "<leader>f", function()
  require("telescope.builtin").find_files()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>g", function()
  require("telescope.builtin").live_grep()
end, { noremap = true, silent = true })
