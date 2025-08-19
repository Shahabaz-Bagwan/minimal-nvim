-- escapes terminal buffer
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local terminal_state = {
	floating = {
		buf = -1,
		win = -1,
	},
}
local lazygit_state = {
	floating = {
		buf = -1,
		win = -1,
	},
}
local api = vim.api

local function get_window_pos(scaling_factor)
	if type(scaling_factor) == "table" then
		scaling_factor = scaling_factor[false]
	end

	local height = math.floor(vim.o.lines * scaling_factor)
	local width = math.floor(vim.o.columns * scaling_factor)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)
	return width, height, row, col
end

local function create_floating_window(scaling_factor)
	local width, height, row, col = get_window_pos(scaling_factor)

	-- Create a new buffer every time
	local buf = vim.api.nvim_create_buf(false, true)

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)
	vim.api.nvim_create_autocmd("VimResized", {
		callback = function()
			vim.defer_fn(function()
				if not vim.api.nvim_win_is_valid(win) then
					return
				end
				local new_width, new_height, new_row, new_col = get_window_pos(scaling_factor)
				api.nvim_win_set_config(win, {
					width = new_width,
					height = new_height,
					relative = "editor",
					row = new_row,
					col = new_col,
				})
			end, 20)
		end,
	})
	return { buf = buf, win = win }
end

local toggle_terminal = function()
	local scaling = 0.8
	if not vim.api.nvim_win_is_valid(terminal_state.floating.win) then
		terminal_state.floating = create_floating_window(scaling)
		vim.cmd("terminal")
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(terminal_state.floating.win)
	end
end

local function open_lazygit(cmd)
	if not cmd or cmd == "" then
		vim.notify("No command provided for floating terminal", vim.log.levels.WARN)
		return
	end

	-- Close any existing lazygit window first
	if vim.api.nvim_win_is_valid(lazygit_state.floating.win) then
		pcall(vim.api.nvim_win_close, lazygit_state.floating.win, true)
	end

	local scaling = 0.9
	lazygit_state.floating = create_floating_window(scaling)

	vim.cmd.terminal(cmd)
	vim.cmd("startinsert")

	vim.api.nvim_create_autocmd("TermClose", {
		buffer = lazygit_state.floating.buf,
		once = true,
		callback = function()
			vim.schedule(function()
				if vim.api.nvim_win_is_valid(lazygit_state.floating.win) then
					pcall(vim.api.nvim_win_close, lazygit_state.floating.win, true)
				end
				if vim.api.nvim_buf_is_valid(lazygit_state.floating.buf) then
					vim.api.nvim_buf_delete(lazygit_state.floating.buf, { force = true })
				end
				lazygit_state.floating.win = -1
				lazygit_state.floating.buf = -1
			end)
		end,
	})
end

local close_terminal = function()
	if vim.api.nvim_buf_is_valid(terminal_state.floating.buf) then
		vim.api.nvim_buf_delete(terminal_state.floating.buf, { force = true })
	end
end

-- Example usage:
vim.api.nvim_create_user_command("ToggleFloatingTerminal", toggle_terminal, {})
vim.api.nvim_create_user_command("CloseTerminal", close_terminal, {})
vim.api.nvim_create_user_command("LazyGit", function()
	open_lazygit("lazygit")
end, {})
vim.api.nvim_create_user_command("ConfigureAll", function()
	open_lazygit("mkdir -p build; cd ./build; cmake .. -G Ninja")
end, {})

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleFloatingTerminal<cr>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>tc", "<cmd>CloseTerminal<cr>", { desc = "Close floating terminal" })
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "open lazygit" })
