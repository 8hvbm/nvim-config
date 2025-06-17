local M = {}
local win = nil

local function center_in(outer, inner)
	return (outer - inner) / 2
end

local function expand_path(path)
	if path:sub(1, 1) == "~" then
		return os.getenv("HOME") .. path:sub(2)
	end
	return path
end

local function win_config()
	local width = math.min(math.floor(vim.o.columns * 0.8), 64)
	local height = math.floor(vim.o.lines * 0.8)
	return{
		relative = "editor",
		width = width,
		height = height,
		col = center_in(vim.o.columns, width),
		row = center_in(vim.o.lines, height),
		border = "single"
	}
end

local function open_floating_file(target_file)
	if win ~= nil and vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_set_current_win(win)
		return
	end

	local expanded_path = expand_path(target_file)
	if vim.fn.filereadable(expanded_path) == 0 then
		vim.notify("Todo list unreadable, directory:" .. expanded_path, vim.log.levels.ERROR)
		return
	end

	local buf = vim.fn.bufnr(expanded_path, true)

	if buf == -1 then
		buf = vim.api.nvim_create_buf(false, false)
		vim.api.nvim_buf_set_name(buf, expanded_path)
	end

	vim.bo[buf].swapfile = false
	win = vim.api.nvim_open_win(buf, true, win_config())
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
		noremap = true,
		silent = true,
		callback = function()
			if vim.api.nvim_get_option_value("modified", { buf = buf }) then
				vim.notify("Please save your changes!", vim.log.levels.WARN)
			else
				vim.api.nvim_win_close(0, true)
				win = nil
			end
		end
	})
end

local function setup_user_commands(opts)
	local target_file = opts.target_file or "todo.md"
	local function init()
		vim.keymap.set("n", "<leader>td", ":Td<CR>", {
			noremap = true,
			silent = true
		})
	end
	init()
	vim.api.nvim_create_user_command("Td", function()
		open_floating_file(target_file)
	end, {})
end

M.setup = function(opts)
	setup_user_commands(opts)
end

return M
