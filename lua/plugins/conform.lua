-- Configuration for conform.nvim
return function()
    local conform = require("conform")

    conform.setup({
        formatters_by_ft = {
            c = {"clang_format"},
            cpp = {"clang_format"},
            objc = {"clang_format"},
            objcpp = {"clang_format"},
            cuda = {"clang_format"},
            proto = {"clang_format"},
            lua = {"lua_format"},
            json = {"jq"}
        },

        -- Configure formatters
        formatters = {
            clang_format = {
                command = "/usr/bin/clang-format-17",
                args = {"--style=file"}, -- Style=file tells clang-format to look for .clang-format files
                -- Use root_dir to ensure it searches up from the current file for .clang-format
                cwd = function(self, ctx)
                    -- Look for .clang-format files starting from the directory of the file being formatted
                    -- and search upwards through parent directories
                    local file_dir = vim.fn.fnamemodify(ctx.filename, ":p:h")
                    return file_dir
                end
            },
            -- Lua formatter
            lua_format = {
                -- You can customize lua-format options here
                command = "/usr/local/bin/lua-format"
            },
            -- JSON formatter
            jq = {
                args = {"--indent", "2"} -- Format JSON with 2-space indentation
            }
        }

        -- Format on save
        -- format_on_save = {
        --   -- These options will be passed to conform.format()
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- },
    })

    -- Keymaps
    local map = vim.keymap.set
    local opts = {noremap = true, silent = true}
    map("n", "<leader>cf", function()
        conform.format({timeout_ms = 1000, lsp_fallback = true})
    end, opts)

    -- Also add visual mode mapping for partial formatting
    map("v", "<leader>cf", function()
        conform.format({timeout_ms = 1000, lsp_fallback = true})
    end, opts)
end

