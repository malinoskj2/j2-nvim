local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

ts_config.setup {
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
  sync_install = true,
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
