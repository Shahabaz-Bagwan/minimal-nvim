vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.nvim", branch = "stable" },
})
require("mini.indentscope").setup({ symbol = "│", options = { try_as_border = true } })
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.statusline").setup()
require("mini.cursorword").setup()
require("mini.pairs").setup()
require("mini.notify").setup()
-- require("mini.tabline").setup()
require("mini.starter").setup()
require("mini.pick").setup()
require("mini.extra").setup()

-- require("mini.clue").setup({
-- 	window = {
-- 		config = { anchor = "SW", row = "auto", col = "auto" },
-- 	},
-- 	triggers = {
-- 		-- Leader triggers
-- 		{ mode = "n", keys = "<Leader>" },
-- 		{ mode = "x", keys = "<Leader>" },
--
-- 		-- Built-in completion
-- 		{ mode = "i", keys = "<C-x>" },
--
-- 		-- `g` key
-- 		{ mode = "n", keys = "g" },
-- 		{ mode = "x", keys = "g" },
--
-- 		-- Marks
-- 		{ mode = "n", keys = "'" },
-- 		{ mode = "n", keys = "`" },
-- 		{ mode = "x", keys = "'" },
-- 		{ mode = "x", keys = "`" },
--
-- 		-- Registers
-- 		{ mode = "n", keys = '"' },
-- 		{ mode = "x", keys = '"' },
-- 		{ mode = "i", keys = "<C-r>" },
-- 		{ mode = "c", keys = "<C-r>" },
--
-- 		-- Window commands
-- 		{ mode = "n", keys = "<C-w>" },
--
-- 		-- `z` key
-- 		{ mode = "n", keys = "z" },
-- 		{ mode = "x", keys = "z" },
-- 	},
--
-- 	clues = {
-- 		-- Enhance this by adding descriptions for <Leader> mapping groups
-- 		require("mini.clue").gen_clues.builtin_completion(),
-- 		require("mini.clue").gen_clues.g(),
-- 		require("mini.clue").gen_clues.marks(),
-- 		require("mini.clue").gen_clues.registers(),
-- 		require("mini.clue").gen_clues.windows(),
-- 		require("mini.clue").gen_clues.z(),
-- 	},
-- })

----------------------------------------------------------------------
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
require("mini.icons").tweak_lsp_kind()
----------------------------------------------------------------------

----------------------------------------------------------------------
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
----------------------------------------------------------------------

----------------------------------------------------------------------
require("mini.files").setup()

vim.keymap.set("n", "<leader>e", function()
	local bufname = vim.api.nvim_buf_get_name(0)
	local _ = require("mini.files").close() or require("mini.files").open(bufname, false)
end, { desc = "File explorer" })
----------------------------------------------------------------------
