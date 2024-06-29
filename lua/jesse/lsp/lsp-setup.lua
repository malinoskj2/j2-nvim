-- LSP Setup
local servers = require "jesse.lsp.language_servers"
local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lsp_keymap = require "jesse.maps.lsp"

local M = {}

local function format_on_write(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }"
  end
end

local function setup_diagnostics()
  vim.diagnostic.config {
    signs = {
      text = { [1] = " ", ["WARN"] = " ", ["HINT"] = " ", ["INFO"] = "󰌵" },
    },
    virtual_text = false,
    underline = false,
  }
end

local function set_diagnostic_symbols()
  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
end

local function on_attach(client)
  -- configure diagnostics
  set_diagnostic_symbols()

  -- Set Keymaps for attached LSP
  lsp_keymap.map()
  -- Format on write if capable
  format_on_write(client)
end

local function get_config(server)
  local base = {
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
  }

  return vim.tbl_deep_extend("force", base, server)
end

M.setup = function()
  setup_diagnostics()

  vim.iter(servers):each(function(server)
    lspconfig[server.config_name].setup(get_config(server))
  end)
end

return M
