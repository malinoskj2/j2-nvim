-- Telescope Configuration
local telescope_present, telescope = pcall(require, "telescope")
local telescope_mapping_config = require "jesse.mapping.plugin.telescope"

-- Setup
telescope.setup {
  defaults = {
    layout_config = { preview_cutoff = 160 },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      mappings = telescope_mapping_config.mappings,
    },
    git_files = {
      shorten_path = true,
      mappings = telescope_mapping_config.mappings,
    },
  },
}

-- Native FZY sorting
telescope.load_extension "fzy_native"
