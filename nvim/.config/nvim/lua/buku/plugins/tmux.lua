vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator" })

local map = vim.keymap.set
local opts = { silent = true }

map("n", "<M-h>", "<Cmd>TmuxNavigateLeft<CR>", opts)
map("n", "<M-j>", "<Cmd>TmuxNavigateDown<CR>", opts)
map("n", "<M-k>", "<Cmd>TmuxNavigateUp<CR>", opts)
map("n", "<M-l>", "<Cmd>TmuxNavigateRight<CR>", opts)
