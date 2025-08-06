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
require("mini.tabline").setup()
require("mini.starter").setup()
require("mini.extra").setup()
require("mini.bracketed").setup()

----------------------------------------------------------------------
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
require("mini.icons").tweak_lsp_kind()
----------------------------------------------------------------------
----------------------------------------------------------------------
require("mini.files").setup()

vim.keymap.set("n", "<leader>e", function()
	local bufname = vim.api.nvim_buf_get_name(0)
	local _ = require("mini.files").close() or require("mini.files").open(bufname, false)
end, { desc = "File explorer" })
----------------------------------------------------------------------

-- files with mini module config
----------------------------------------------------------------------
require("plugins.mini-pick")
require("plugins.mini-clue")
require("plugins.mini-completion")
----------------------------------------------------------------------
