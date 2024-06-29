-- VimEnter Auto Commands
local util = require "jesse.core.util"

-- Resize vim after launch
-- See https://github.com/neovim/neovim/issues/11330 for why this is needed
vim.cmd [[
  augroup SetWindowSize
    autocmd!
    autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
  augroup END
]]

vim.api.nvim_create_augroup("DecreaseTerminalPaddingX", { clear = false })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = "DecreaseTerminalPaddingX",
  pattern = "*",
  command = "silent !alacritty msg config 'window.padding.x=0'"
})

vim.api.nvim_create_augroup("DecreaseTerminalPaddingY", { clear = false })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = "DecreaseTerminalPaddingY",
  pattern = "*",
  command = "silent !alacritty msg config 'window.padding.y=0'"
})
