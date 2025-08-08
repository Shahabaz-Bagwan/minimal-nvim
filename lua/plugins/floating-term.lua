-- escapes terminal buffer
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
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

local function create_floating_window(scaling_factor, opts)
	local width, height, row, col = get_window_pos(scaling_factor)
	opts = opts or {}

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
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
	local scaling = 0.618
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window(scaling, { buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
			vim.cmd("startinsert")
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

local open_lazygit = function()
	local scaling = 0.9
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window(scaling, { buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal("lazygit")
			vim.cmd("startinsert")
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

local close_terminal = function()
	vim.api.nvim_buf_delete(state.floating.buf, { force = true })
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("ToggleFloatingTerminal", toggle_terminal, {})
vim.api.nvim_create_user_command("CloseTerminal", close_terminal, {})
vim.api.nvim_create_user_command("LazyGit", open_lazygit, {})

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleFloatingTerminal<cr>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>tc", "<cmd>CloseTerminal<cr>", { desc = "Close floating terminal" })
vim.keymap.set("n", "<leader>tg", "<cmd>LazyGit<cr>", { desc = "open lazygit" })
