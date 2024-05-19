return {
    {
        {
            "vhyrro/luarocks.nvim",
            priority = 1001, -- this plugin needs to run before anything else
            opts = {
                rocks = { "magick" },
            },
        },
        {
            "3rd/image.nvim",
            dependencies = { "luarocks.nvim" },
            config = function()
                -- if using Neovide, don't load the "imaeg" plugin as it's not supported
                if vim.g.neovide then
                    return
                end
                require("image").setup({
                    backend = "kitty",
                    kitty_method = "normal",
                    integrations = {
                        markdown = {
                            enabled = true,
                            clear_in_insert_mode = false,
                            download_remote_images = true,
                            only_render_image_at_cursor = false,
                            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                        },
                        neorg = {
                            enabled = true,
                            clear_in_insert_mode = false,
                            download_remote_images = true,
                            only_render_image_at_cursor = false,
                            filetypes = { "norg" },
                        },
                    },
                    max_width = nil,
                    max_height = nil,
                    max_width_window_percentage = nil,
                    max_height_window_percentage = 50,
                    window_overlap_clear_enabled = false,                                     -- toggles images when windows are overlapped
                    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
                    editor_only_render_when_focused = false,                                  -- auto show/hide images when the editor gains/looses focus
                    tmux_show_only_in_active_window = false,                                  -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
                })
            end,
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                version = "2.*",
                config = function()
                    require("window-picker").setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
        config = function()
            require("neo-tree").setup({
                commands = {
                    copy_path = function(state)
                        -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
                        -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
                        local node = state.tree:get_node()
                        local filepath = node:get_id()
                        local filename = node.name
                        local modify = vim.fn.fnamemodify

                        local results = {
                            filepath,
                            modify(filepath, ":."),
                            modify(filepath, ":~"),
                            filename,
                            modify(filename, ":r"),
                            modify(filename, ":e"),
                        }

                        vim.ui.select({
                            "1. Absolute path: " .. results[1],
                            "2. Path relative to CWD: " .. results[2],
                            "3. Path relative to HOME: " .. results[3],
                            "4. Filename: " .. results[4],
                            "5. Filename without extension: " .. results[5],
                            "6. Extension of the filename: " .. results[6],
                        }, { prompt = "Choose to copy to clipboard:" }, function(choice)
                            if choice then
                                local i = tonumber(choice:sub(1, 1))
                                if i then
                                    local result = results[i]
                                    vim.fn.setreg('*', result)
                                    vim.notify("Copied: " .. result)
                                else
                                    vim.notify("Invalid selection")
                                end
                            else
                                vim.notify("Selection cancelled")
                            end
                        end)
                    end,
                },
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                        ["Y"] = "copy_path",
                    },
                },
            })

            -- vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left toggle<CR>", {})
            vim.api.nvim_set_keymap(
                "n",
                "<C-b>",
                "<Cmd>Neotree filesystem reveal left toggle<CR>",
                { noremap = true, silent = true }
            )
        end,
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup()
            vim.api.nvim_set_keymap(
                "n",
                "-",
                "<Cmd>Oil<CR>",
                { noremap = true, silent = true, desc = "Open Parent Directory" }
            )
        end
    }
}
