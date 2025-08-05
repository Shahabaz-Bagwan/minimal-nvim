vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
})
require("gitsigns").setup({
	signs = {
		delete = { text = "󰍵" },
		changedelete = { text = "󱕖" },
		add = { text = "│" },
		change = { text = "│" },
		topdelete = { text = "‾" },
		untracked = { text = "│" },
	},
})
