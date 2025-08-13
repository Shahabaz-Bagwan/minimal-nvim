require("config.globals")
require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.colorscheme")
require("plugins.nvim-treesitter")
require("plugins.mini")
require("plugins.mini-pick")
require("plugins.mini-clue")
require("plugins.nvim-dev-icons")
require("plugins.floating-term")
require("plugins.persistence")
require("config.lsp")

-- Only load Render-Markdown for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.cmd("packadd render-markdown.nvim")
		require("plugins.render-markdown")
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
		require("plugins.mini-completion")

		vim.cmd("packadd conform.nvim")
		require("plugins.conform")

		vim.cmd("packadd gitsigns.nvim")
		require("plugins.gitsigns")

		vim.cmd("packadd nvim-lspconfig")

		vim.cmd("packadd dressing.nvim")
		require("plugins.dressing")

		vim.cmd("packadd indent-blankline.nvim")
		require("plugins.indent-blankline")
		-- etc. for only the ones you actually use
	end,
})

vim.api.nvim_create_user_command("Mason", function()
	vim.cmd("packadd mason.nvim")
	vim.cmd("packadd mason-lspconfig.nvim")
	vim.cmd("packadd mason-tool-installer.nvim")
	require("plugins.mason").setup()
end, {})
