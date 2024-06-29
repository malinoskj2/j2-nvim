-- Lazy

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require("lazy.view.config").keys.close = "<esc>"
require("lazy").setup {
  spec = {
    { import = "jesse.plugin.specs" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
}
