-- insertEnter Auto Commands

-- Vertically center document when entering Insert mode
vim.cmd [[
  autocmd insertEnter * norm zz
]]
