return function()
  -- Highlight settings
  vim.cmd([[
    hi LspReferenceText ctermbg=gray guibg=gray
    hi LspReferenceRead ctermbg=lightblue guibg=lightblue
    hi LspReferenceWrite ctermbg=lightgreen guibg=lightgreen
  ]])

  local nvim_lsp = require('lspconfig')
  local navic = require("nvim-navic")

  -- Navic setup
  navic.setup({
    icons = {
      File          = "󰈙 ",
      Module        = " ",
      Namespace     = "󰌗 ",
      Package       = " ",
      Class         = "󰌗 ",
      Method        = "󰆧 ",
      Property      = " ",
      Field         = " ",
      Constructor   = " ",
      Enum          = "󰕘",
      Interface     = "󰕘",
      Function      = "󰊕 ",
      Variable      = "󰆧 ",
      Constant      = "󰏿 ",
      String        = "󰀬 ",
      Number        = "󰎠 ",
      Boolean       = "◩ ",
      Array         = "󰅪 ",
      Object        = "󰅩 ",
      Key           = "󰌋 ",
      Null          = "󰟢 ",
      EnumMember    = " ",
      Struct        = "󰌗 ",
      Event         = " ",
      Operator      = "󰆕 ",
      TypeParameter = "󰊄 ",
    },
    lsp = {
      auto_attach = false,
      preference = nil,
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
  })

  local working_dir = vim.fn.getcwd()

  -- LSP attach function
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- LSP keymaps
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

    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end

  -- LSP servers setup
  nvim_lsp.clangd.setup({
    cmd = {
      "/usr/bin/clangd-17",
      "--background-index",
      "--compile-commands-dir=" .. working_dir,
      "--enable-config",
      "--header-insertion=never",
      "--offset-encoding=utf-16"
    },
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  })

  nvim_lsp.bashls.setup({})
  nvim_lsp.pyright.setup({})

  nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true
        },
      }
    }
  })
end 