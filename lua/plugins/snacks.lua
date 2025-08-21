vim.pack.add({
	{
		src = "https://github.com/folke/snacks.nvim",
	},
})

-- snacks.nvim setup
require("snacks").setup({
	bigfile = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { enabled = true },
	quickfile = { enabled = true },
	rename = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	lazygit = { enabled = true },
	terminal = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = false },
})

-- keymaps
local map = vim.keymap.set
local picker = require("snacks.picker")

map("n", "<leader>lg", function()
	require("snacks").lazygit()
end, { desc = "open lazygit" })

map("n", "<leader>tt", function()
	require("snacks").terminal()
end, { desc = "toggle terminal" })

map("n", "<leader>ff", function()
	picker.projects()
end, { desc = "find folders" })

map("n", "<leader>fw", function()
	picker.grep()
end, { desc = "live grep" })

map("n", "<leader>fa", function()
	picker.smart()
end, { desc = "smart file search" })

map("n", "<leader>fh", function()
	picker.help()
end, { desc = "help page" })

map("n", "<leader>ma", function()
	picker.marks()
end, { desc = "find marks" })

map("n", "<leader>fib", function()
	picker.lines()
end, { desc = "find in current buffer" })

map("n", "<leader>fb", function()
	picker.buffers()
end, { desc = "find buffer" })

map("n", "<leader>fo", function()
	picker.recent()
end, { desc = "find from recent files" })

map("n", "<leader>gh", function()
	picker.git_diff()
end, { desc = "git hunks" })

-- lsp
map("n", "<leader>gd", function()
	picker.lsp_definitions()
end, { desc = "go to definition" })

map("n", "<leader>gdi", function()
	picker.diagnostics()
end, { desc = "go to diagnostic" })

map("n", "<leader>gD", function()
	picker.lsp_declarations()
end, { desc = "go to declaration" })

map("n", "<leader>gi", function()
	picker.lsp_implementations()
end, { desc = "go to implementation" })

map("n", "<leader>gr", function()
	picker.lsp_references()
end, { desc = "go to references" })

map("n", "<leader>gt", function()
	picker.lsp_type_definitions()
end, { desc = "go to type_definition" })

map("n", "<leader>gs", function()
	picker.lsp_symbols()
end, { desc = "find document_symbol" })

map("n", "<leader>ws", function()
	picker.lsp_workspace_symbols()
end, { desc = "find workspace_symbol" })

map("n", "<leader>fg", function()
	picker.registers()
end, { desc = "resume old search" })

map("n", "<leader>fr", function()
	picker.resume()
end, { desc = "resume old search" })

map("n", "<leader>fk", function()
	picker.keymaps()
end, { desc = "show all keymaps" })

map("n", "z=", function()
	picker.spelling()
end, { desc = "show spelling suggestions" })
