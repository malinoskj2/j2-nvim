return {
  name = "yamlls",
  config_name = 'yamlls',
  filetypes = { "yml", "yaml", "yaml.docker-compose", "yaml.gitlab" },
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    },
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- schemastore plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}
