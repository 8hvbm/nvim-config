return {
	"folke/zen-mode.nvim",
	config = function()
	require("zen-mode").setup({
		window = {
			-- width = 83,
			width = 0.70,
		},
	})
	vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>")
	end
}
