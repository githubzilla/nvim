return function()
-- Set the clang-format command and enable style file detection
vim.g["clang_format#detect_style_file"] = 1
vim.g["clang_format#command"] = "/usr/bin/clang-format-18"

-- Map <leader>cf to the ClangFormat command
vim.api.nvim_set_keymap('n', '<leader>cf', '<cmd>ClangFormat<cr>', { noremap = true, silent = true })
end 
