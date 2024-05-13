return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- add TreeSitter for syntax highlighting
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "lua", "javascript", "vim", "vimdoc", "regex", "bash", "markdown", "markdown_inline" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "fei6409/log-highlight.nvim",
        config = function()
            require("log-highlight").setup({})
        end,
    },
}
