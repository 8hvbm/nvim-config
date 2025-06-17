return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			"ThePrimeagen/harpoon",
			"folke/noice.nvim",
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = function(plugin)
					local obj = vim.system(
						{ 'cmake', '-S.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release' },
						{ cwd = plugin.dir }):wait()
					if obj.code ~= 0 then error(obj.stderr) end
					obj = vim.system({ 'cmake', '--build', 'build', '--config', 'Release' },
						{ cwd = plugin.dir }):wait()
					if obj.code ~= 0 then error(obj.stderr) end
					obj = vim.system({ 'cmake', '--install', 'build', '--prefix', 'build' },
						{ cwd = plugin.dir }):wait()
					if obj.code ~= 0 then error(obj.stderr) end
				end
			}
		},
		config = function()
			require('telescope').setup {
				defaults = {
					prompt_prefix = "🔍 ", --search bar
					selection_caret = "➤ ", --selection bar
					file_ignore_patterns = {},
				},
				-- Default configuration for telescope goes here:
				-- config_key = value,
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
					find_files = {
						hidden = true,
					},
					live_grep = {
						additional_args = function(opts)
							return { "--hidden" }
						end
					}
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					}
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value
					-- }
					-- please take a look at the readme of the extension you want to configure
				}
			}
			require("telescope").load_extension("fzf") --loadfzf
			require("telescope").load_extension('harpoon') --harpoon
			require("telescope").load_extension("noice") -- load noice.nvim

			--setup keymaps
			local nor = { noremap = true, silent = true }
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) --files
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) --grep
			vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {}) --diagnostics
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) --help_tags
			vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {}) --recentfiles
			vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, {}) --workspace symbol check
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) --search buffers
			vim.keymap.set('n', '<leader>hp', ":Telescope harpoon marks<CR>", nor)
			vim.keymap.set('n', '<leader>fo', ":Telescope oldfiles<CR>", nor)
			vim.keymap.set('n', '<leader>fm', ":Noice telescope<CR>", nor)
			vim.keymap.set('n', '<leader>ft', ":Telescope treesitter<CR>", nor)
		end,
	},
}
