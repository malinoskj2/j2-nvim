-- VimLeave Auto Commands

-- Set cursor shape when leaving vim
vim.cmd [[
  augroup SetCmdlineCursorShape
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
  augroup END
]]
