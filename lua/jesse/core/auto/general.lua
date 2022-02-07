-- General Auto Commands

-- Disable for certain filetypes
vim.cmd [[
   autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("jesse.core.util").hide_status_line()
]]
