local map = vim.keymap.set
-- keymap
--------------------------------------------------------------------------------
-- Navigate visual lines
map({ "n", "x" }, "j", "gj", { desc = "Navigate down (visual line)", silent = true })
map({ "n", "x" }, "k", "gk", { desc = "Navigate up (visual line)", silent = true })
map({ "n", "x" }, "<Down>", "gj", { desc = "Navigate down (visual line)", silent = true })

map({ "n", "v" }, ";", ":", { desc = "Enter cmd" })

map({ "n", "x" }, "<Up>", "gk", { desc = "Navigate up (visual line)", silent = true })
map("i", "<Down>", "<C-\\><C-o>gj", { desc = "Navigate down (visual line)", silent = true })

map("i", "<Up>", "<C-\\><C-o>gk", { desc = "Navigate up (visual line)", silent = true })

map(
	{ "n", "v" },
	"j",
	'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
	{ desc = "Move down", silent = true, expr = true }
)

map({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true, silent = true })

map(
	{ "n", "v" },
	"Up",
	'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
	{ desc = "Move up", expr = true, silent = true }
)

map(
	{ "n", "v" },
	"Down",
	'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
	{ desc = "Move down", expr = true, silent = true }
)

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down", silent = true })
map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move Line Up", silent = true })

-- Toggle visible whitespace characters
map("n", "<leader>l", ":set list!<cr>", { desc = "Toggle [l]istchars", silent = true })

-- Diagnostic keymaps
map("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })

local function open_lsp_references_in_qf()
	vim.lsp.buf.references()

	vim.defer_fn(function()
		local items = vim.fn.getloclist(0)
		if not vim.tbl_isempty(items) then
			vim.fn.setqflist({}, " ", {
				title = "LSP References",
				items = items,
			})
			vim.cmd("copen")
		else
			print("No references found.")
		end
	end, 50) -- Delay to allow the loclist to be populated
end

vim.keymap.set("n", "gr", open_lsp_references_in_qf, { desc = "Go to references (quickfix)" })

-- Toggle the quickfix list window
local function toggle_quickfix()
	local quickfix_open = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.api.nvim_buf_get_option(buf, "buftype") == "quickfix" then
			quickfix_open = true
			break
		end
	end

	if quickfix_open then
		vim.cmd.cclose()
	else
		vim.cmd.copen()
	end
end

-- Mappings
vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Toggle quickfix list" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line", silent = true })
map("i", "<C-e>", "<End>", { desc = "move end of line", silent = true })
map("i", "<C-h>", "<Left>", { desc = "move left", silent = true })
map("i", "<C-l>", "<Right>", { desc = "move right", silent = true })
map("i", "<C-j>", "<Down>", { desc = "move down", silent = true })
map("i", "<C-k>", "<Up>", { desc = "move up", silent = true })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up", silent = true })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights", silent = true })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file", silent = true })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file", silent = true })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new", silent = true })

map("n", "<tab>", "<cmd>bn<cr>", { desc = "buffer goto next", nowait = true })
map("n", "<S-tab>", "<cmd>bp<cr>", { desc = "buffer goto prev", nowait = true })
map("n", "<leader>ca", "<cmd> %bd <bar> e# <bar> bd# <bar> '\" <CR>", { desc = "buffer close others", nowait = true })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "buffer close", silent = true })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true, silent = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true, silent = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
