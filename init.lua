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

require("vim-options")
require("lazy").setup("plugins")

-- set up LSP
require("lsp-config")

-- color theme
vim.o.background = "dark" -- or "light"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_better_performance = 1
vim.cmd([[colorscheme gruvbox-material]]) -- gruvbox gruvbox-material catppuccin tokyonight solarized-osaka
