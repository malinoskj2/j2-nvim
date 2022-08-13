-- Lsp Installer
local lsp_installer = require "nvim-lsp-installer"
local List = require "pl.List"

local languages = require "jesse.lsp.languages"
local servers = require "jesse.lsp.language_servers"

-- Install servers
List(languages)
  :filter(function(language)
    return language.language_server
  end)
  :filter(function(language)
    local ok, server = require("nvim-lsp-installer.servers").get_server(language.language_server["name"])
    return ok and not server:is_installed()
  end)
  :foreach(function(language)
    local _, server = require("nvim-lsp-installer.servers").get_server(language.language_server["name"])
    server:install()
  end)

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
  local config = vim.tbl_deep_extend("force", {
    capabilities = require("jesse.lsp.handlers").capabilities,
  }, servers[server.name] or {})

  config.on_attach = function(client, bufnr)
    -- Call base on_attach
    require("jesse.lsp.handlers").on_attach(client, bufnr)

    -- Call on_attach for specific server if exists
    if servers[server.name].on_attach ~= nil then
      servers[server.name].on_attach(client, bufnr)
    end
  end

  if servers[server.name] and servers[server.name].setup then
    vim.pretty_print(server.name .. ": " .. "Running if branch")
    servers[server.name].setup {
      server = config,
    }
  else
    vim.pretty_print(server.name .. ": " .. "Running if branch")
    server:setup(config)
  end
end)
