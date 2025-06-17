require("config.lazy")
local todolist = require("todolist")
todolist.setup({
	target_file = "~/.config/nvim/notes/todo.md"
})

vim.o.hidden = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.wildmenu = true
vim.opt.termguicolors = true

vim.cmd.colorscheme("kanagawa")

vim.api.nvim_set_keymap('n', "<leader>dt", ":diffthis<CR>", {
	noremap = true,
	silent = true
} )
vim.api.nvim_set_keymap('n', "<leader>do", ":diffoff<CR>", {
	noremap = true,
	silent = true
} )

-- Windows actions
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})
