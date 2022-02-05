-- General
local tablex = require "pl.tablex"

vim.cmd [[set iskeyword+=-]]
vim.cmd [[syntax on]]

local options = {
  number = true,
  swapfile = false,
  cursorline = true,
  ignorecase = true,
  smartcase = true,
  termguicolors = true,
  mouse = "a",
  splitbelow = true,
  splitright = true,
  undofile = true,
  undodir = "/tmp/nvim/undodir",
  signcolumn = "yes",
  cmdheight = 1,
}

tablex.foreach(options, function(value, key)
  vim.opt[key] = value
end)
