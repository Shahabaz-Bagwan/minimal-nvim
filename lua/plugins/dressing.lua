vim.pack.add({
	"https://github.com/stevearc/dressing.nvim",
})
require("dressing").setup({
	input = {
		enabled = true,
	},
	select = {
		enabled = false, -- keep using mini.pick
	},
})
