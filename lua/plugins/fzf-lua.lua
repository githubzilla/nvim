return function()
    -- Define common filter pattern for ripgrep
    local common_filter =
        "--no-ignore-vcs --glob=!*.o --glob=!*.d --glob=!bld/** --glob=!bin/** --glob=!.git/** --glob=!.cache/** --glob=!node_modules/** --glob=!build/** --glob=!compile_commands* --glob=!install/** --glob=!dist/** --glob=!coverage/** --glob=!vendor/** --glob=!*.min.js --glob=!*.min.css --glob=!*.map --glob=!.vscode/** --glob=!output/** --glob=!*.log --glob=!*.tmp --glob=!*.swp --glob=!*.swo --glob=!*.bak --glob=!*.old --glob=!*.orig --glob=!.idea/**"

    require("fzf-lua").setup({
	"hide",
        -- Path display options
        files = {
            path_shorten = 9, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        lsp = {
            path_shorten = 9, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        grep = {
            path_shorten = 9, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        buffers = {
            path_shorten = 9, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        previewers = {
            builtin = {
                treesitter = {
                    enabled = true, -- Enable treesitter preview
                    disabled = {}, -- Disable for specific filetypes
                    context = {
                        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                        multiwindow = false, -- Enable multiwindow support.
                        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                        line_numbers = true,
                        multiline_threshold = 20, -- Maximum number of lines to show for a single context
                        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
                        -- Separator between context and content. Should be a single character string, like '-'.
                        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                        separator = nil,
                        zindex = 20, -- The Z-index of the context window
                        on_attach = nil -- (fun(buf: integer): boolean) return false to disable attaching
                    }
                }
            }
        },

        -- Open in window mode instead of popup
        winopts = {
            -- Configure preview window to show up as a side window
            preview = {
                default = "builtin",
                vertical = "right:65%", -- Show preview on right side taking 45% of width
                horizontal = "down:50%", -- For horizontal splits, show below with 50% height
                layout = "vertical", -- Default to vertical layout
                delay = 100, -- Small delay before preview
                title = true, -- Show file title
                scrollbar = "float",
                wrap = true
            },
            -- Use a standard split window instead of a popup
            -- split = "belowright new",
            height = 0.85, -- 80% of screen height
            width = 0.90, -- Full width
            border = "rounded", -- Rounded corners
            fullscreen = false
        },

        fzf_opts = {
            ["--layout"] = "reverse", -- Cursor at top
            ["--info"] = "inline",
            ["--cycle"] = true
        }
    })

    -- Keymaps
    local map = vim.keymap.set
    local opts = {noremap = true, silent = true}
    local fzf = require("fzf-lua")

    -- File finding
    map('n', '<leader>ff', function()
        fzf.files({cmd = "rg --files " .. common_filter, line_query = true})
    end, opts)

    map('n', '<leader>fg', function()
        fzf.live_grep({
            rg_opts = common_filter ..
                " --no-heading --with-filename --line-number --column --smart-case"
        })
    end, opts)
    map('n', '<leader>fG', function()
        fzf.live_grep({
            rg_opts = common_filter ..
                "--no-heading --with-filename --line-number --column --smart-case",
            search = vim.fn.expand('<cword>')
        })
    end, opts)
    -- Fix duplicate key mapping by changing to <leader>fw (word under cursor)
    map('n', '<leader>fw', function()
        fzf.live_grep({
            rg_opts = common_filter ..
                " --no-heading --with-filename --line-number --column --smart-case",
            search = vim.fn.expand('<cword>')
        })
    end, opts)

    -- Additional fzf-lua mappings
    map('n', '<leader>fr', function() fzf.grep_project() end, opts)
    map('n', '<leader>fb', function() fzf.buffers() end, opts)
    map('n', '<leader>fh', function() fzf.help_tags() end, opts)
    map('n', '<leader>fs', function() fzf.grep_cword() end, opts)
    map('n', '<leader>fS',
        function() fzf.grep_cword({fzf_opts = {["--exact"] = ""}}) end, opts)
    map('n', '<leader>fc', function() fzf.lgrep_curbuf() end, opts)
    map('n', '<leader>fC',
        function() fzf.lgrep_curbuf({search = vim.fn.expand('<cword>')}) end,
        opts)
    map('n', '<leader>ft', function() fzf.treesitter() end, opts)
    map('n', '<leader>fT', function()
        local current_word = vim.fn.expand('<cword>')
        -- Pass the word as the initial query and call with_nth to ensure proper matching
        fzf.treesitter({fzf_opts = {["--query"] = current_word}})
    end, opts)
    map('n', '<leader>di', function() fzf.diagnostics_document() end, opts)

    -- LSP related
    map('n', '<leader>ld', function() fzf.lsp_document_symbols() end, opts)
    map('n', '<leader>lD', function()
        local current_word = vim.fn.expand('<cword>')
        fzf.lsp_document_symbols({fzf_opts = {["--query"] = current_word}})
    end, opts)
    map('n', '<leader>lw', function() fzf.lsp_workspace_symbols() end, opts)
    map('n', '<leader>lW', function()
        local current_word = vim.fn.expand('<cword>')
        fzf.lsp_workspace_symbols({fzf_opts = {["--query"] = current_word}})
    end, opts)
    map('n', '<leader>lr', function() fzf.lsp_references() end, opts)

    -- Resume
    map('n', '<leader>tr', function() fzf.resume() end, opts)
end
