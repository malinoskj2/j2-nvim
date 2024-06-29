return {
  "declancm/cinnamon.nvim",
  config = function()
    local cinnamon = require "cinnamon"

    cinnamon.setup {
      -- Enable all provided keymaps
      keymaps = {
        basic = false,
        extra = false,
      },
      -- Only scroll the window
      options = { mode = "cursor", delay = 2, },
    }

    require "jesse.maps.cinnamon"
  end
}
