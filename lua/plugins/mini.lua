vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.nvim", branch = "stable" },
})
require("mini.indentscope").setup({ symbol = "│", options = { try_as_border = true } })
require("mini.icons").setup()

require("mini.files").setup()

vim.keymap.set("n", "<leader>e", function()
	local bufname = vim.api.nvim_buf_get_name(0)
	local _ = require("mini.files").close() or require("mini.files").open(bufname, false)
end, { desc = "File explorer" })

require("mini.statusline").setup()
require("mini.cursorword").setup()

vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
	snippets = {
		-- Load custom file with global snippets first (adjust for Windows)
		gen_loader.from_file("~/.config/nvim/snippets/global.json"),

		-- Load snippets based on current language by reading files from
		-- "snippets/" subdirectories from 'runtimepath' directories.
		gen_loader.from_lang(),
	},
})

require("mini.completion").setup()
require("mini.ai").setup()
require("mini.surround").setup()
