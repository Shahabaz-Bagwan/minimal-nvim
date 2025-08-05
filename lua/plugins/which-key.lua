vim.pack.add({
  {src = "https://github.com/folke/which-key.nvim" }
})
require("which-key").setup()
-- whichkey
vim.keymap.set("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

vim.keymap.set("n", "<leader>wk", function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end, { desc = "whichkey query lookup" })
