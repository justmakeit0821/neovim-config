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
				-- default config
				require("image").setup({
					backend = "kitty",
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
					window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
					window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
					editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
					tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
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
				window = {
					mappings = {
						["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
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
}
