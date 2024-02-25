return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        -- actually set the color scheme to catppuccin
        vim.cmd.colorscheme "catppuccin"
    end
} 
