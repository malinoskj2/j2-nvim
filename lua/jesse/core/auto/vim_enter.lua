-- VimEnter Auto Commands

-- Resize vim after launch
-- See https://github.com/neovim/neovim/issues/11330 for why this is needed
vim.cmd [[
  augroup SetWindowSize
    autocmd!
    autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
  augroup END
]]
