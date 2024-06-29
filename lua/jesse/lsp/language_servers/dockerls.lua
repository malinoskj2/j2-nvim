return {
  name = "dockerls",
  config_name = 'dockerls',
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    }
  }
}
