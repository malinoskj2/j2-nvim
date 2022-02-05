local null_ls = require "null-ls"
local tablex = require "pl.tablex"
local List = require "pl.List"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Setup Sources
local languages = require "jesse.lsp.languages"
local servers = require "jesse.lsp.null_language_servers"

local sources = List(languages)
  :map(function(language)
    return language.null_language_servers
  end)
  :filter(function(null_language_servers)
    return null_language_servers
  end)
  :reduce(function(acc, cur)
    return List(acc):extend(List(cur))
  end, List())
  :map(function(null_language_server)
    return List {
      servers[null_language_server].diagnostics and diagnostics[null_language_server] or false,
      servers[null_language_server].formatting and formatting[null_language_server] or false,
    }
  end)
  :reduce(function(acc, cur)
    return List(acc):extend(List(cur))
  end, List())
  :filter(function(source)
    return source
  end)

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()"
    end
  end,
}
