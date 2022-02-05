-- Plugin Mapping

local List = require "pl.List"

local modules = List {
  "jesse.mapping.plugin.nvim-tree",
}

modules:foreach(function(module)
  require(module)
end)
