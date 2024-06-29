-- LSP Installer

local mason_lspconfig = require "mason-lspconfig"
local mason_null_ls = require "mason-null-ls"

local M = {}

local function get_required_language_servers(languages)
  return vim
    .iter(languages)
    :map(function(language)
      return language.language_server.name
    end)
    :totable()
end

local function get_required_null_language_servers(languages)
  return vim
    .iter(languages)
    :map(function(language)
      return language.null_language_servers
    end)
    :flatten(1)
    :totable()
end

M.install = function(languages)
  --  mason_lspconfig.setup {
  --    ensure_installed = get_required_language_servers(languages),
  --  }

  --  mason_null_ls.setup {
  --    ensure_installed = get_required_null_language_servers(languages),
  --  }
end

return M
