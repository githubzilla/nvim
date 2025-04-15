return function()
  require('neorg').setup({
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/syncthing/org/",
          },
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {}, -- Neorg export to-file <file_name>.md
    },
  })
end 
