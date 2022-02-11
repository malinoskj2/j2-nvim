-- Jesse's Neovim config :)

local List = require "pl.List"

local modules = List {
  "jesse.core",
  "jesse.mapping",
  "jesse.lsp",
  "jesse.plugin",
}

modules
  :map(function(module)
    local ok, _ = pcall(require, module)
    return { ok = ok, module = module }
  end)
  :filter(function(result)
    return not result.ok
  end)
  :foreach(function(failed_load)
    print("Failed to load module: " .. failed_load.module)
  end)
