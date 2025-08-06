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

require("mini.completion").setup({
	lsp_completion = { source_func = "omnifunc", auto_setup = false },
})
