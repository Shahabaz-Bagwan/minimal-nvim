vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		sh = { "shfmt", "shellcheck" },
		bash = { "shfmt", "shellcheck" },
		tex = { "tex-fmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		["*"] = { "codespell" },
	},
})
vim.keymap.set({ "n", "x" }, "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })
