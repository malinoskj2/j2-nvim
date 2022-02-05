-- Auto Commands
local List = require "pl.List"

local modules = List {
  "jesse.core.auto.insert_enter",
  "jesse.core.auto.vim_leave",
}

modules:foreach(function(module)
  require(module)
end)
