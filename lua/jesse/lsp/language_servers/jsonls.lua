return {
  capabilities = {
    formatting = false,
  },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}
