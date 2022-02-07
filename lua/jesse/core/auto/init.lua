-- Auto Commands
local List = require "pl.List"

local modules = List {
  "jesse.core.auto.insert_enter",
  "jesse.core.auto.vim_leave",
  "jesse.core.auto.general",
}

modules:foreach(function(module)
  require(module)
end)
