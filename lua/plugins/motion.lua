return {
    url = "https://codeberg.org/andyg/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    keys = {
        { "s",  "<Plug>(leap-forward)",     mode = { "n", "x", "o" } },
        { "S",  "<Plug>(leap-backward)",    mode = { "n", "x", "o" } },
        { "gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" } },
    }
}
