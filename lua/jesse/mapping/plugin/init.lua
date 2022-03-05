-- Plugin Mapping

local List = require "pl.List"

local modules = List {
  "jesse.mapping.plugin.nvim-tree",
  "jesse.mapping.plugin.telescope",
}

modules:foreach(function(module)
  require(module)
end)
