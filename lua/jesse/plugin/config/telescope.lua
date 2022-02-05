-- Telescope Configuration
local telescope_present, telescope = pcall(require, "telescope")
local builtin_present, builtin = pcall(require, "telescope.builtin")

if not telescope_present or not builtin_present then
  return
end

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

-- Native FZY sorting
telescope.load_extension "fzy_native"

-- Fallback to find_files if not in git repo
local git_or_find_files = function()
  local opts = {}
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

-- Launch mappings
vim.keymap.set("n", "<leader>f", function()
  git_or_find_files()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>g", function()
  builtin.live_grep()
end, { noremap = true, silent = true })
