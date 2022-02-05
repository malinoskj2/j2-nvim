-- Core Mapping

local List = require "pl.List"

local modules = List {
  "jesse.mapping.core.general",
  "jesse.mapping.core.lsp",
}

modules:foreach(function(module)
  require(module)
end)
