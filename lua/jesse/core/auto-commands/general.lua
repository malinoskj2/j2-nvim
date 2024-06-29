-- General Auto Commands

-- Set Spelling on when appropriate
vim.cmd [[
  augroup EnableSpelling
    autocmd!
    au FileType markdown,gitcommit setlocal spell 
    au FileType markdown,gitcommit setlocal spelllang=en_us 
  augroup END
]]
