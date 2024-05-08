return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                version = "^1.0.0",
            },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = { height = 0.9, mirror = true, prompt_position = "bottom" },
                },
                pickers = {
                    find_files = {
                        path_display = { "smart" },
                    },
                },
                extensions = {
                    live_grep_args = {
                        path_display = { "smart" },
                    },
                },
            })

            require("telescope").load_extension("live_grep_args")
            local builtin = require("telescope.builtin")

            -- set key bindings for Telescope functions
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("file_browser")

            -- open file_browser with the path of the current buffer
            vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
        end,
    },
}
