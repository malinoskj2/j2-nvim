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

return M
