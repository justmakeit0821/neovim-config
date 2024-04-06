return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		-- call setup() to create the default mappings, e.g., "gcc" to comment a line
		require("Comment").setup()
	end,
}
