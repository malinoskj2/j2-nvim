return {
  'freddiehaddad/feline.nvim',
  dependencies = { "catppuccin/nvim" },
  opts = {},
  config = function()
    local ctp_feline = require('catppuccin.groups.integrations.feline')

    ctp_feline.setup()

    local ctp_components = ctp_feline.get()
    table.remove(ctp_components.active, 2) -- Remove Diganostic components

    require("feline").setup({
      components = ctp_components,
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        package.loaded["feline"] = nil
        package.loaded["catppuccin.groups.integrations.feline"] = nil
        require("feline").setup {
          components = ctp_components,
        }
      end,
    })
  end
}
