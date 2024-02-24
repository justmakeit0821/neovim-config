-- wrap Vimscript code (as string) inside vim.cmd
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- set leader key to space
vim.g.mapleader = " "

-- set up lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- vim.opt => vim option table
-- rtp stands for "runtimepath" (a list of directories Neovim searches for runtime files)
vim.opt.rtp:prepend(lazypath)

-- plugins defined in a Lua's table
local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}
-- add (by require) lazy.nvim to be used in Neovim
require("lazy").setup(plugins, opts)

-- add Telescope
local builtin = require("telescope.builtin")
-- set key bindings for Telescope functions
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- add TreeSitter for syntax highlighting
local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = {"lua", "javascript"},
    highlight = { enable = true },
    indent = { enable = true },
})

-- add catppuccin color scheme
require("catppuccin").setup()
-- actually set the color scheme to catppuccin
vim.cmd.colorscheme "catppuccin"
