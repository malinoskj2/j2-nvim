-- Plugins

local packer = require "jesse.plugin.packer"
local use = packer.use
local use_rocks = packer.use_rocks

-- Install
packer.startup {
  function()
    -- Util
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use {
      "rcarriga/nvim-notify",
      config = function()
        require "jesse.plugin.config.nvim-notify"
      end,
    }
    use "kyazdani42/nvim-web-devicons"

    -- Performance
    -- use "lewis6991/impatient.nvim"

    -- Colors
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require "jesse.plugin.config.catppuccin"
        vim.cmd [[colorscheme catppuccin]]
      end,
    }
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    }

    -- Dashboard
    use {
      "goolord/alpha-nvim",
      config = function()
        require("alpha").setup(require("alpha.themes.dashboard").opts)
      end,
    }

    -- Line
    use {
      "feline-nvim/feline.nvim",
      config = function()
        require("feline").setup {
          components = require "jesse.plugin.config.feline",
        }
      end,
    }

    -- Navigation
    use "farmergreg/vim-lastplace"
    use {
      "petertriho/nvim-scrollbar",
      config = function()
        require "jesse.plugin.config.nvim-scrollbar"
      end,
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require "jesse.plugin.config.telescope"
      end,
    }
    use "nvim-telescope/telescope-fzy-native.nvim"

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = { { "onsails/lspkind-nvim" }, { "L3MON4D3/LuaSnip" } },
      config = function()
        require "jesse.plugin.config.cmp"
      end,
    }
    use "onsails/lspkind-nvim"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use {
      "windwp/nvim-autopairs",
      config = function()
        require "jesse.plugin.config.nvim-autopairs"
      end,
    }

    -- Language
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "jesse.plugin.config.treesitter"
      end,
    }
    use "b0o/schemastore.nvim"
    use "RRethy/nvim-treesitter-endwise"

    -- TS
    use "jose-elias-alvarez/nvim-lsp-ts-utils"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require "jesse.plugin.config.gitsigns"
      end,
    }

    -- Tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = function()
        require("nvim-tree").setup {
          disable_netrw = true,
          hijack_netrw = true,
          auto_close = true,
          hijack_cursor = true,
        }
      end,
    }

    -- Comment
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    }
    -- use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
}
