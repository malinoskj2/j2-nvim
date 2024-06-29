-- Set filetypes where neccesary

vim.api.nvim_create_augroup("SetFileTypeDockerCompose", { clear = false })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "SetFileTypeDockerCompose",
  pattern = "docker-compose.*",
  command = "set filetype=yaml.docker-compose"
})
