return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "dockerfile",
        "go",
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "make",
        "markdown",
        "php",
        "python",
        "rust",
        "scala",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
        "zig",
      },
      sync_install = false,
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      endwise = {
        enable = true,
      },
    }
  end,
}
