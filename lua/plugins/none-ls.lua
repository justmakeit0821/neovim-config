return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
                -- for formatting lua
				null_ls.builtins.formatting.stylua,
                -- for formatting javascript
				null_ls.builtins.formatting.prettier,
                -- for linting javascript
				null_ls.builtins.diagnostics.eslint_d
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
