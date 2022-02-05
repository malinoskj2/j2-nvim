-- Lsp Mappings
local List = require "pl.List"

local M = {}

local opts = { noremap = true, silent = true, buffer = 0 }

local mappings = {
  { "n", "gD", vim.lsp.buf.declaration },
  { "n", "gd", vim.lsp.buf.definition },
  { "n", "K", vim.lsp.buf.hover },
  { "n", "gi", vim.lsp.buf.implementation },
  { "n", "<C-k>", vim.lsp.buf.signature_help },
  { "n", "<leader>rn", vim.lsp.buf.rename },
  { "n", "gr", vim.lsp.buf.references },
  { "n", "<leader>ca", vim.lsp.buf.code_action },
  {
    "n",
    "[d",
    function()
      vim.diagnostic.goto_prev { border = "rounded" }
    end,
  },
  {
    "n",
    "gl",
    function()
      vim.diagnostic.open_float { border = "rounded" }
    end,
  },
  {
    "n",
    "]d",
    function()
      vim.diagnostic.goto_next { border = "rounded" }
    end,
  },
  { "n", "<leader>q", vim.diagnostic.setloclist },
}

M.map = function()
  List(mappings):foreach(function(mapping)
    vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
  end)
end

return M
