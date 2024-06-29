-- VimLeave Auto Commands
local util = require "jesse.core.util"

-- Set cursor shape when leaving vim
vim.cmd [[
  augroup SetCmdlineCursorShape
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
  augroup END
]]

vim.api.nvim_create_augroup("IncreaseTerminalPaddingX", { clear = false })
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  group = "IncreaseTerminalPaddingX",
  pattern = "*",
  command = "silent !alacritty msg config 'window.padding.x=13'"
})

vim.api.nvim_create_augroup("IncreaseTerminalPaddingY", { clear = false })
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  group = "IncreaseTerminalPaddingY",
  pattern = "*",
  command = "silent !alacritty msg config 'window.padding.y=13'"
})
