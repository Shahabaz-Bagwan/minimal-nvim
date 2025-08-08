require("config.globals")
require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.lsp")
require("config.colorscheme")
require("plugins.conform")
require("plugins.nvim-treesitter")
require("plugins.mini")
-- require("plugins.mason")
require("plugins.nvim-dev-icons")
require("plugins.gitsigns")
require("plugins.persistence")
require("plugins.dressing")
-- require("plugins.render-markdown")
require("plugins.floating-term")

-- Only load Render-Markdown for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.cmd("packadd render-markdown.nvim")
		require("plugins.render-markdown").setup()
	end,
})

-- Load mini.nvim modules in parts, not all at once
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.cmd("packadd mini.nvim")
		require("mini.indentscope").setup({ symbol = "│", options = { try_as_border = true } })
		require("mini.surround").setup()
		require("mini.cursorword").setup()
		require("mini.pairs").setup()
		require("plugins.mini-pick")
		require("plugins.mini-clue")
		require("plugins.mini-completion")
		-- etc. for only the ones you actually use
	end,
})

vim.api.nvim_create_user_command("Mason", function()
	vim.cmd("packadd mason.nvim")
	vim.cmd("packadd mason-lspconfig.nvim")
	vim.cmd("packadd mason-tool-installer.nvim")
	require("plugins.mason").setup()
end, {})
