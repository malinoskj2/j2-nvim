-- Nvim-tree Configuration
local mapping_config = require "jesse.mapping.plugin.nvim-tree"

require("nvim-tree").setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  view = {
    auto_resize = true,
    mappings = {
      list = mapping_config.list,
    },
  },
}
