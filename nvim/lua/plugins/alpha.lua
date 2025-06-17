return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		'nvim-tree/nvim-web-devicons',
		'nvim-telescope/telescope.nvim',
	},

	config = function()
		local alpha = require 'alpha'
		local dashboard = require 'alpha.themes.dashboard'

		-- Set the dashboard
		dashboard.section.header.val = {

			[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣋⡉⣭⣴⣶⣶⣶⣶⣦⡭⠉⣛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⡏⢰⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣦⣽⡙⢦⣝⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⣿⡿⣸⣥⣷⡌⠈⡉⠤⠶⣾⣿⡏⠉⠩⠭⢩⠭⢹⣿⣿⣿⣿⣷⡌⢿⣿⣿⣿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⡏⡼⣧⣮⣿⠟⣀⣒⡒⠾⠟⡒⠦⢰⡞⣐⢋⡆⠈⠛⠻⢿⣿⣿⡿⠸⠿⠿⢿⣿⣿⣿⣿]],
			[[⣿⣿⡿⢛⣉⣍⣥⣈⠉⠉⠁⣚⡻⢯⣝⣛⠶⣦⣅⡘⢫⣴⣿⡿⠿⠷⠆⠲⠌⢁⣰⣶⣾⣿⠘⣿⣿⣿⣿]],
			[[⣿⣿⡇⣾⠋⢀⣳⡸⠛⣡⣤⣦⣭⣕⣂⠉⡛⠿⢿⠁⣿⣿⠏⣠⣛⣵⠀⠁⠀⣛⣛⣿⣸⣿⠁⣿⣿⣿⣿]],
			[[⣿⣿⣷⣌⠀⠸⠟⢡⣾⣿⣿⣿⣿⣿⣿⡟⣴⣶⣤⠀⣄⣀⠈⢉⢀⠉⠀⠀⠀⡈⠛⢻⣽⡟⣸⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣶⢆⣾⣿⣿⣿⣿⠿⠟⣫⡄⣿⣿⡇⣦⡙⠿⣯⠹⣟⢿⣶⡆⠠⠤⠄⣤⣬⡘⢿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣯⣉⠴⠾⣿⣿⣿⡟⠛⢰⠆⠤⠀⠸⠿⠂⣶⠀⣄⠈⢁⣈⣿⣿⣿⣆⠻⣿⣿⣿⠿⣢⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⡋⢥⡄⣿⣿⣿⣿⣷⢸⣿⣶⣾⣧⣀⠸⣷⣶⠶⢊⣼⣿⣿⡿⣿⣮⢀⣉⢩⣷⣾⣿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣶⠆⡘⠀⣿⡿⢿⢀⡻⢿⣿⣿⡿⣿⠿⠟⢃⣴⣿⣿⣿⠳⢘⣿⢊⣿⣂⡛⢿⣿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⡟⢰⡿⢧⡘⢿⢀⡀⣻⠶⣤⣤⠀⠀⢀⠠⡿⢡⣿⣿⠟⣱⡾⢫⡜⠟⢛⠩⣄⣽⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⡌⠈⠀⠹⣶⠤⠞⠏⠃⣈⡀⠈⠰⠂⠓⡀⠘⠏⠀⠂⣴⣶⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⣿⣷⣦⣶⡦⠀⠀⠀⡼⣋⣵⡦⠉⢶⣦⡄⠻⣿⡾⠂⣤⣍⠛⢿⣿⣿⣿⣿⠿⣿⣿⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⢂⣠⣾⣷⡈⢋⠀⠼⡀⠘⠗⠄⡿⢠⣿⢟⣠⣾⠘⠿⠿⠿⠇⣾⡆⢻⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣴⣿⣿⣿⣿⣿⡟⠀⢺⣿⣿⣶⣾⡇⡾⣡⣾⣿⣿⣇⢛⣛⣛⠻⣿⡇⢸⣿⣿]],
			[[⣿⣿⣿⣿⣿⣿⣿⠟⢛⠃⣿⣿⣿⣿⣿⣿⢋⣴⣿⣿⣿⣿⣿⡇⢡⣿⣿⣿⣿⣿⡌⢛⡛⠃⢿⡇⣾⣿⣿]],
			[[⣿⣿⣿⣿⣿⡿⢡⣾⣦⣌⡘⠿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⠿⠇⣘⣋⣩⣭⣭⣙⣛⡘⠟⣋⣠⡅⢻⣿⣿]],
			[[⣿⠛⠍⠭⠭⣭⣤⡙⠛⢻⠿⣷⣮⠹⣄⠀⣿⣿⡿⢛⣭⣴⣶⡏⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿]],
			[[⣿⡌⡭⣙⡓⢒⡒⣒⡾⢰⡆⢻⣿⣆⢻⠘⣿⠟⣴⣿⣿⣿⣿⠟⢀⣙⣛⣩⣭⣥⣼⣿⣷⣄⠀⣌⢡⣾⣿]],
			"How's the tea? Eh? Good but weird taste?",
		}

		-- Set up some useful buttons~
		dashboard.section.buttons.val = {
			dashboard.button("b", "  > Browse Files", ":Oil --float<CR>"),
			dashboard.button("s", "༗  > Search File", ":Telescope find_files<CR>"),
			dashboard.button("n", "  > New File", ":ene <BAR> startinsert<CR>"),
			dashboard.button("h", "⥙  > Harpooned Files", ":Telescope harpoon marks<CR>"),
			dashboard.button("r", "⏲  > Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "➜  > Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end
}
