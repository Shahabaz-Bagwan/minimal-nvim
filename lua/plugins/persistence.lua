vim.pack.add(
  {
    { src = "https://github.com/folke/persistence.nvim" }
  }
)
require("persistence").setup()
vim.keymap.set("n", "<leader>rs", function() require("persistence").load() end, { desc = "Restore Session" })
vim.keymap.set("n", "<leader>rls", function() require("persistence").load({ last = true }) end,
  { desc = "Restore Last Session" })
