vim.pack.add({
  { src="https://github.com/kdheepak/lazygit.nvim" }
})
require("lazygit")
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", {desc = "open lazygit"})
