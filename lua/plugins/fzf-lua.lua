return function()
    -- Define common filter pattern for ripgrep
    local common_filter =
        "--no-ignore-vcs --glob=!*.o --glob=!*.d --glob=!bld/** --glob=!bin/** --glob=!.git/** --glob=!.cache/** --glob=!node_modules/** --glob=!build/**"

    require("fzf-lua").setup({
        -- Path display options
        files = {
            path_shorten = 5, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        lsp = {
            path_shorten = 5, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        grep = {
            path_shorten = 5, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        buffers = {
            path_shorten = 5, -- Shorten directory names to first letter
            formatter = "path.filename_first"
        },

        -- Open in window mode instead of popup
        winopts = {
            -- Configure preview window to show up as a side window
            preview = {
                vertical = "right:65%", -- Show preview on right side taking 45% of width
                horizontal = "down:50%", -- For horizontal splits, show below with 50% height
                layout = "vertical", -- Default to vertical layout
                delay = 100, -- Small delay before preview
                title = true, -- Show file title
                scrollbar = "float"
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
            ["--info"] = "inline"
        }
    })

    -- Keymaps
    local map = vim.keymap.set
    local opts = {noremap = true, silent = true}
    local fzf = require("fzf-lua")

    -- File finding
    map('n', '<leader>ff',
        function() fzf.files({cmd = "rg --files " .. common_filter}) end, opts)

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
