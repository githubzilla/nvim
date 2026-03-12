return function()
  -- Highlight settings (unchanged)
  vim.cmd([[
    hi LspReferenceText ctermbg=gray guibg=gray
    hi LspReferenceRead ctermbg=lightblue guibg=lightblue
    hi LspReferenceWrite ctermbg=lightgreen guibg=lightgreen
  ]])

  local working_dir = vim.fn.getcwd()

  -- Function to set buffer-local LSP keymaps on attach
  local function on_lsp_attach(args)
    local bufnr = args.buf
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  -- Setup clangd config using vim.lsp.config
  vim.lsp.config('clangd', {
    cmd = {
      "/usr/bin/clangd-20",
      "--background-index",
      "--compile-commands-dir=" .. working_dir,
      "--enable-config",
      "--header-insertion=never",
      "--offset-encoding=utf-16"
    },
    flags = {
      debounce_text_changes = 150,
    },
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"},
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  -- Enable clangd LSP server
  vim.lsp.enable('clangd')

  -- Create autocmd to assign keymaps on LspAttach event instead of on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      on_lsp_attach(args)
      -- You can add navic.attach(client, bufnr) here if desired, checking args.client_id
      -- local client = vim.lsp.get_client_by_id(args.data.client_id)
      -- if client.server_capabilities.documentSymbolProvider then
      --   require("nvim-navic").attach(client, args.buf)
      -- end
    end,
  })

  -- Uncomment and migrate other LSP servers similarly by defining their configs with vim.lsp.config and enabling them
  -- e.g.

  vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'basic',
        }
      }
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
  vim.lsp.enable('pyright')

  -- Register the GitHub Copilot config to suppress the checkhealth warning.
  -- copilot.vim manages its own LSP client; this just satisfies vim.lsp's
  -- config registry.
  vim.lsp.config('GitHub Copilot', {})

end
