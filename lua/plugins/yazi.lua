return function()
  require("yazi").setup({
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    open_files_in = "current",
    floating_window_scaling_factor = 0.95,
    yazi_floating_window_winblend = 0,
    yazi_floating_window_border = "rounded",
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "<c-v>",
      open_file_in_horizontal_split = "<c-x>",
      open_file_in_tab = "<c-t>",
      grep_in_directory = "<c-g>",
      replace_in_directory = "<c-r>",
      cycle_open_buffers = "<tab>",
    },
    integrations = {
      grep_in_directory = function(directory)
        -- Use fzf-lua for grep in directory
        require("fzf-lua").live_grep({ cwd = directory })
      end,
    },
  })

  -- Keymaps
  vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<cr>",
    { desc = "Open yazi at the current file" })
  vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>",
    { desc = "Open yazi in nvim's working directory" })
  vim.keymap.set("n", "<c-up>", "<cmd>Yazi toggle<cr>",
    { desc = "Resume the last yazi session" })
end
