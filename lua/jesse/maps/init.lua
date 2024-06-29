-- Maps

local modules = {
  "jesse.maps.general",
  "jesse.maps.telescope",
  "jesse.maps.neo-tree",
}

vim.iter(modules):each(function(module)
  require(module)
end)
