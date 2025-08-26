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
	explorer = {
		enabled = true,
	},
	picker = {
		enabled = true,
		sources = {
			grep = {
				args = {
					"--ignore-case",
				},
			},
			explorer = {
				layout = {
					{ preview = true },
					layout = {
						box = "horizontal",
						width = 0.8,
						height = 0.8,
						{
							box = "vertical",
							border = "rounded",
							title = "{source} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
					},
				},
			},
		},
	},
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

map("n", "<leader>se", function()
	picker.explorer()
end, { desc = "open snacks explorer" })

map("n", "<leader>gll", function()
	picker.git_log_line()
end, { desc = "show git line log" })

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
