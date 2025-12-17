-- Configuration for conform.nvim
return function()
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- C/C++ files
    c = { "clang_format" },
    cpp = { "clang_format" },
    h = { "clang_format" },
    -- Lua files
    lua = { "lua_format" },
    -- JSON files
    json = { "jq" },
    jsonc = { "jq" },
    -- ProtoBuf files
    proto = { "buf_format" },
    -- Bash/Shell files
    sh = { "shfmt" },
    bash = { "shfmt" },
    -- Python files
    python = { "black" },
    -- Javascript files
    javascript = { "prettier" },
  },
  formatters = {
    -- C/C++ formatter
    clang_format = {
      command = "/usr/bin/clang-format-18",
      args = {
        "--assume-filename=$FILENAME",
        "--style=file",

        "--fallback-style=none",
      },
      stdin = true,
      cwd = require("conform.util").root_file({
        ".clang-format",
        ".clang-format-18",
        ".clang-tidy",
        "compile_commands.json",
        "Makefile",
        "CMakeLists.txt",
      }),
    },
    -- Lua formatter
    lua_format = {
      command = "lua-format",
      args = {
        "--indent-width=2",
        "--tab-width=2",
        "--continuation-indent-width=2",
        "--spaces-before-call=1",
        -- "--double-quote-to-single-quote=true",
        "--column-limit=80",
      },
      stdin = true,
    },
    -- JSON formatter
    jq = {
      command = "jq",
      args = { "." },
      stdin = true,
    },
    -- ProtoBuf formatter
    buf_format = {
      command = "buf",
      args = { "format", "-" },
      stdin = true,
    },
    -- Bash/Shell formatter
    shfmt = {
      command = "shfmt",
      args = {
        "-i", "2",
        "-bn",
        "-ci",
        "-sr",
      },
      stdin = true,
    },
    -- Python formatter - Black
    black = {
      command = "black",
      args = {
        "--quiet",  -- Suppress output
        "-",        -- Read from stdin
      },
      stdin = true,
    },
    -- Javascript formatter - Prettierd
    prettierd = {
      command = "prettierd",
      args = { "$FILENAME" },
      stdin = true,
    },
  },
})

-- Keymap to format current buffer
vim.keymap.set("n", "<leader>cf", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file" })

-- Visual mode keymap to format selection
vim.keymap.set("v", "<leader>cf", function()
  conform.format({
    range = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format selection" })

-- Format on save for various file types
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = {
--     "*.c", "*.cpp", "*.h", "*.hpp",  -- C/C++
--     "*.lua",                         -- Lua
--     "*.json", "*.jsonc",             -- JSON
--     "*.proto",                       -- ProtoBuf
--     "*.sh", "*.bash",                -- Shell scripts
--   },
--   callback = function(args)
--     conform.format({
--       bufnr = args.buf,
--       lsp_fallback = true,
--       async = false,
--       timeout_ms = 1000,
--
--     })
--   end,
-- })
end

