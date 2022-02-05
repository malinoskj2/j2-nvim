-- Tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- PHP Tabs
vim.cmd [[
  autocmd Filetype php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
]]
