return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons', "catppuccin/nvim" },
  config = function()
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            -- text = vim.fn.fnamemodify(vim.fn.getcwd(), ':t'),
            text = "",
            text_align = "center",
            separator = false
          }
        },
        diagnostics = "nvim_lsp"
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get()
    }
  end
}
