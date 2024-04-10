-- wrap Vimscript code (as string) inside vim.cmd
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

-- set leader key to space
vim.g.mapleader = " "
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- break clipboard silo between Neovim and outside Neovim
vim.cmd("set clipboard+=unnamedplus")
