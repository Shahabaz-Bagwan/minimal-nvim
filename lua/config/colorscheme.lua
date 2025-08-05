vim.pack.add({
	"https://github.com/Mofiqul/dracula.nvim",
})

require("dracula").setup()
vim.cmd([[colorscheme dracula]])
