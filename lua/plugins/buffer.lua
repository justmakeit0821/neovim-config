return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = true
        end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = "^1.0.0", -- optional: only update when a new 1.x version is released,
        config = function()
            require("barbar").setup()

            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            -- Magic buffer-picking mode
            map("n", "<leader>t", "<Cmd>BufferPick<CR>", opts)
        end,
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup({
                hooks = {
                    pre_tab_leave = function()
                        vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
                    end,

                    post_tab_enter = function()
                        vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
                    end,
                },
            })

            require("telescope").load_extension("scope")
            vim.api.nvim_set_keymap("n", "<C-e>", "<Cmd>Telescope scope buffers<CR>", { noremap = true, silent = true })
        end,
    },
    {
        "Bekaboo/dropbar.nvim",
        -- optional, but required for fuzzy finder support
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        opts = {},
    },
}
