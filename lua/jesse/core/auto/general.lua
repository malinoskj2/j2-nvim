-- General Auto Commands

-- Disable for certain filetypes
vim.cmd [[
   autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("jesse.core.util").hide_status_line()
]]

-- Set Spelling on when appropriate
vim.cmd [[
  augroup EnableSpelling
    autocmd!
    au FileType markdown,gitcommit setlocal spell 
    au FileType markdown,gitcommit setlocal spelllang=en_us 
  augroup END
]]
