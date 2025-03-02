local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer navigation
map("n", "<space>p", ":bprevious<CR>", opts)
map("n", "<space>n", ":bnext<CR>", opts)
map("n", "<leader>bf", ":buffers<CR>:buffer ", opts)
map("n", "<leader>bd", ":bd<CR>", opts)

-- Quickfix navigation
map("n", "<leader>qn", ":cn<CR><ESC>", opts)
map("n", "<leader>qp", ":cp<CR><ESC>", opts)

-- Line operations
map("n", "<c-s>", "i<CR><ESC>", opts)
map("n", "<c-j>", ":join!<CR><ESC>", opts)

-- File explorer
map("n", "<leader>e", ":Explore<CR>", opts)

-- Clipboard
map("v", "<F2>", '"+y', opts)
map("n", "<F2>", '"+y', opts) 