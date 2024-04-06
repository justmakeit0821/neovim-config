return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            user_default_options = {
                css_fn = true,
                css = true,
            },
        })
    end,
}
