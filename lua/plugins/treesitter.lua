return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- add TreeSitter for syntax highlighting
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"lua", "javascript"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
 
