-- Auto Commands

local modules = {
  "jesse.core.auto-commands.insert_enter",
  "jesse.core.auto-commands.vim_enter",
  "jesse.core.auto-commands.vim_leave",
  "jesse.core.auto-commands.general",
  "jesse.core.auto-commands.filetype",
}

vim.iter(modules):each(function(module)
  require(module)
end)
