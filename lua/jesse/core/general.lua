-- General

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
  clipboard = "unnamedplus",
  laststatus = 3,
  scrolloff = 5
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
