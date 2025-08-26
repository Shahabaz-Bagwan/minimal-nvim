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

map("n", "<leader>lg", ":lua Snacks.lazygit()<cr>", { desc = "open lazygit", silent = true })

map("n", "<leader>tt", ":lua Snacks.terminal()<cr>", { desc = "toggle terminal", silent = true })

map("n", "<leader>se", ":lua Snacks.picker.explorer()<cr>", { desc = "open snacks explorer", silent = true })

map("n", "<leader>ff", ":lua Snacks.picker.projects()<cr>", { desc = "find folders", silent = true })

map("n", "<leader>fw", ":lua Snacks.picker.grep()<cr>", { desc = "live grep", silent = true })

map("n", "<leader>fa", ":lua Snacks.picker.smart()<cr>", { desc = "smart file search", silent = true })

map("n", "<leader>fh", ":lua Snacks.picker.help()<cr>", { desc = "help page", silent = true })

map("n", "<leader>ma", ":lua Snacks.picker.marks()<cr>", { desc = "find marks", silent = true })

map("n", "<leader>fib", ":lua Snacks.picker.lines()<cr>", { desc = "find in current buffer", silent = true })

map("n", "<leader>fb", ":lua Snacks.picker.buffers()<cr>", { desc = "find buffer", silent = true })

map("n", "<leader>fo", ":lua Snacks.picker.recent()<cr>", { desc = "find from recent files", silent = true })

map("n", "<leader>fg", ":lua Snacks.picker.registers()<cr>", { desc = "find registers", silent = true })

map("n", "<leader>fr", ":lua Snacks.picker.resume()<cr>", { desc = "resume old search", silent = true })

map("n", "<leader>gh", ":lua Snacks.picker.git_diff()<cr>", { desc = "git hunks", silent = true })

map("n", "<leader>gfl", ":lua Snacks.picker.git_log_file()<cr>", { desc = "show git file log", silent = true })

map("n", "<leader>gll", ":lua Snacks.picker.git_log_line()<cr>", { desc = "show git line log", silent = true })

-- lsp
map("n", "<leader>gd", ":lua Snacks.picker.lsp_definitions()<cr>", { desc = "go to definition", silent = true })

map("n", "<leader>gdi", ":lua Snacks.picker.diagnostics()<cr>", { desc = "go to diagnostic", silent = true })

map("n", "<leader>gD", ":lua Snacks.picker.lsp_declarations()<cr>", { desc = "go to declaration", silent = true })

map("n", "<leader>gi", ":lua Snacks.picker.lsp_implementations()<cr>", { desc = "go to implementation", silent = true })

map("n", "<leader>gr", ":lua Snacks.picker.lsp_references()<cr>", { desc = "go to references", silent = true })

map("n", "<leader>fk", ":lua Snacks.picker.keymaps()<cr>", { desc = "show all keymaps", silent = true })

map("n", "z=", ":lua Snacks.picker.spelling()<cr>", { desc = "show spelling suggestions", silent = true })

map("n", "<leader>gs", ":lua Snacks.picker.lsp_symbols()<cr>", { desc = "find document_symbol", silent = true })

map(
	"n",
	"<leader>gt",
	":lua Snacks.picker.lsp_type_definitions()<cr>",
	{ desc = "go to type_definition", silent = true }
)
map(
	"n",
	"<leader>ws",
	":lua Snacks.picker.lsp_workspace_symbols()<cr>",
	{ desc = "find workspace_symbol", silent = true }
)
