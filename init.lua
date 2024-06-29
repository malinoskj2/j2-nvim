-- Jesse's Neovim config :)

local modules = {
  "jesse.core",
  "jesse.maps",
  "jesse.plugin.lazy",
  "jesse.lsp",
}

vim.iter(modules):each(function(module)
  require(module)
end)
