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
  server:setup(vim.tbl_deep_extend("force", {
    on_attach = require("jesse.lsp.handlers").on_attach,
    capabilities = require("jesse.lsp.handlers").capabilities,
  }, servers[server.name] or {}))
end)
