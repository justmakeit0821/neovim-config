return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- add Telescope
			local builtin = require("telescope.builtin")

			-- set key bindings for Telescope functions
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
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
		"nvim-telescope/telescope-live-grep-args.nvim",
		version = "^1.0.0",
		config = function()
			require("telescope").load_extension("live_grep_args")
			vim.keymap.set("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		end,
	},
}
