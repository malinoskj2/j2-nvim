-- Core
local List = require "pl.List"

local modules = List {
  "jesse.core.auto",
  "jesse.core.commands",
  "jesse.core.general",
  "jesse.core.performance",
  "jesse.core.tab",
  "jesse.core.util",
}

modules:foreach(function(module)
  require(module)
end)
