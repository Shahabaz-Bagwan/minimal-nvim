require("mini.pick").setup({
	window = {
		config = function()
			local height, width, starts, ends
			local win_width = vim.o.columns
			local win_height = vim.o.lines

			if win_height <= 25 then
				height = math.min(win_height, 18)
				width = win_width
				starts = 1
				ends = win_height
			else
				width = math.floor(win_width * 0.7) -- 50%
				height = math.floor(win_height * 0.7) -- 30%
				starts = math.floor((win_width - width) / 2)
				ends = math.floor(win_height * 0.65)
			end

			return {
				col = starts,
				row = ends,
				height = height,
				width = width,
				style = "minimal",
			}
		end,

		-- String to use as cursor in prompt
		prompt_caret = "|",

		-- String to use as prefix in prompt
		prompt_prefix = "",
	},
})
vim.ui.select = require("mini.pick").ui_select
local map = vim.keymap.set
map("n", "<leader>fw", "<cmd>Pick grep_live<CR>", { desc = "live grep" })
map("n", "<leader>fh", "<cmd>Pick help<CR>", { desc = "help page" })
map("n", "<leader>ma", "<cmd>Pick marks<CR>", { desc = "find marks" })
map("n", "<leader>fb", "<cmd>Pick buf_lines<CR>", { desc = "find in current buffer" })
map("n", "<leader>fa", "<cmd>Pick files<cr>", { desc = "find all files" })

map("n", "<leader>gs", "<cmd>Pick git_hunks<CR>", { desc = "git status" })

map("n", "<leader>gd", "<cmd>Pick lsp scope='definition'<CR>", { desc = "go to definition" })
map("n", "<leader>gD", "<cmd>Pick lsp scope='declaration'<CR>", { desc = "go to declaration" })
map("n", "<leader>gi", "<cmd>Pick lsp scope='implementation'<CR>", { desc = "go to implementation" })
map("n", "<leader>gr", "<cmd>Pick lsp scope='references'<CR>", { desc = "go to references" })
map("n", "<leader>gt", "<cmd>Pick lsp scope='type_definition'<CR>", { desc = "go to type_definition" })
map("n", "<leader>fs", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "find document_symbol" })
map("n", "<leader>ws", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "find workspace_symbol" })

map("n", "<leader>fr", "<cmd>Pick resume <CR>", { desc = "resume old search" })
map("n", "<leader>fk", "<cmd>Pick keymaps <CR>", { desc = "show all keymaps" })
