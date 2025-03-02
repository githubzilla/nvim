return function()
  -- docker run --platform linux/amd64 -d -p 8889:8080 plantuml/plantuml-server:jetty-v1.2020.23
  vim.g.preview_uml_url = 'http://localhost:8889'
  vim.keymap.set('n', '<leader>uml', '<cmd>PreviewUML<cr>', { silent = true })
end 