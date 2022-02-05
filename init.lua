-- Jesse's Neovim config :)

local List = require "pl.List"

local modules = List {
  "jesse.core",
  "jesse.mapping",
  "jesse.lsp",
  "jesse.plugin",
}

modules:foreach(function(module)
  require(module)
end)
