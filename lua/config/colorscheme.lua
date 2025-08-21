vim.pack.add({
	"https://github.com/Mofiqul/dracula.nvim",
	"https://github.com/folke/tokyonight.nvim",
})

require("dracula").setup()
require("tokyonight").setup()
vim.cmd([[colorscheme tokyonight]])
