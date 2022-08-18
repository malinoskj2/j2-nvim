-- Lsp Installer
local lsp_installer = require "nvim-lsp-installer"
local mason_lspconfig = require "mason-lspconfig"
local util = require "jesse.core.util"

local languages = require "jesse.lsp.languages"
local servers = require "jesse.lsp.language_servers"

local function get_required_language_servers()
  return vim.tbl_map(function(language)
    return language.language_server.name
  end, languages)
end

local function get_required_null_language_servers()
  local null_language_servers = vim.tbl_map(function(language)
    return language.null_language_servers
  end, languages)

  return vim.tbl_flatten(null_language_servers)
end

-- Install servers
mason_lspconfig.setup {
  ensure_installed = util.concatArray(get_required_language_servers(), get_required_null_language_servers()),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local config = vim.tbl_deep_extend("force", {
      capabilities = require("jesse.lsp.handlers").capabilities,
    }, servers[server_name] or {})

    config.on_attach = function(client, bufnr)
      -- Call base on_attach
      require("jesse.lsp.handlers").on_attach(client, bufnr)

      -- Call on_attach for specific server if exists
      if servers[server_name].on_attach ~= nil then
        servers[server_name].on_attach(client, bufnr)
      end
    end

    if servers[server_name] and servers[server_name].setup then
      servers[server_name].setup {
        server = config,
      }
    else
      require("lspconfig")[server_name].setup(config)
    end
  end,
}
