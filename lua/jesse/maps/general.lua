-- Mappings
local util = require("jesse.core.util")

-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mappings = {
  -- Disable ESC to exit Insert mode
  { "",  "<Space>",          "<Nop>" },
  -- Use jk/kj to exit Insert mode
  { "i", "<ESC>",            "<Nop>" },
  { "i", "jk",               "<ESC>" },
  { "i", "kj",               "<ESC>" },
  -- Navigate buffers
  { "n", "<S-l>",            ":bnext<CR>" },
  { "n", "<S-h>",            ":bprevious<CR>" },
  -- Better split navigation
  { "n", "<C-h>",            "<C-w>h" },
  { "n", "<C-j>",            "<C-w>j" },
  { "n", "<C-k>",            "<C-w>k" },
  { "n", "<C-l>",            "<C-w>l" },
  -- Open Horizontal Split
  { "n", "<C-s>",            util.open_vertical_split },
  -- Close Stuff
  { "n", "<C-c>",            util.close_all },
  { "n", "<esc>",            util.close_all,          "lazy", },
  -- Write changes to buffer
  { "n", "<leader><leader>", ":w<CR>" },
}

local opts = { noremap = true, silent = true }

for key, value in ipairs(mappings) do
  -- Handle bind for specific filetype
  if value[4] then
    vim.api.nvim_create_autocmd("FileType", {
      pattern = value[5],
      desc = "Quit lazy with <esc>",
      callback = function()
        vim.keymap.set(value[1], value[2], value[3], { buffer = true, nowait = true })
      end,
    })
  else
    vim.keymap.set(value[1], value[2], value[3], opts)
  end
end
