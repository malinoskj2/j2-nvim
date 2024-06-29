-- Null LSP Setup
local null_ls = require "null-ls"
local servers = require "jesse.lsp.null_language_servers"

local M = {}

local function get_source(server)
  local builtin = null_ls.builtins[server.type][server.config_name]

  if server.extra_args ~= nil then
    return builtin.with {
      extra_args = server.extra_args,
    }
  else
    return builtin
  end
end

local function on_attach(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }"
  end
end

M.setup = function()
  local sources = vim
    .iter(servers)
    :map(function(server)
      return get_source(server)
    end)
  :totable()

  null_ls.setup {
    sources = sources,
    on_attach = on_attach,
  }
end

return M
