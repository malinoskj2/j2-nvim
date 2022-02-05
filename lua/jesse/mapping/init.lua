-- Mapping
local List = require "pl.List"

local modules = List {
  "jesse.mapping.core",
  "jesse.mapping.plugin",
}

modules:foreach(function(module)
  require(module)
end)
