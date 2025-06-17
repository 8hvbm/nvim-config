return{
    "xiyaowong/transparent.nvim",
    config = function()
        vim.keymap.set("n", "<leader>t", ":TransparentToggle<CR>", {
		silent = true
		})
    end
}
