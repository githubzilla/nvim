return function()
  local codecompanion = require("codecompanion")

  codecompanion.setup({
    interactions = {
      chat = {adapter = {name = "opencode"}}
    }
  })
end
