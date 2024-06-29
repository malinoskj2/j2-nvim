return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup {
      handlers = {
        cursor = false,
        diagnostic = false,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false,   -- Requires hlslens
        ale = false,      -- Requires ALE
      },
    }
  end,
}
