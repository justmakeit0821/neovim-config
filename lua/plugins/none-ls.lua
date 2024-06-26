return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- for formatting lua
				null_ls.builtins.formatting.stylua,
				-- for formatting javascript
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<M-S-f>", vim.lsp.buf.format, {})
	end,
}
