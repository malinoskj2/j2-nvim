return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  config = function()
    local telescope = require "telescope"
    -- Setup
    telescope.setup {
      defaults = {
        layout_config = { preview_cutoff = 160 },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
        git_files = {
          shorten_path = true,
        },
      },
    }
  end,
}
