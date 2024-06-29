-- Core

local modules = {
  "jesse.core.auto-commands",
  "jesse.core.commands",
  "jesse.core.general",
  "jesse.core.performance",
  "jesse.core.tab",
  "jesse.core.util",
}

vim.iter(modules):each(function(module)
  require(module)
end)
