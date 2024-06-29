return {
  name = "phpmd",
  config_name = 'phpmd',
  type = 'diagnostics',
  extra_args = function()
    if vim.fn.filereadable("phpmd.xml") == 1 then
      return { "phpmd.xml" }
    end
  end
}
