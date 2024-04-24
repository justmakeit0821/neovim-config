return {
    { "RRethy/vim-illuminate" },
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup({})
        end
    },
}
