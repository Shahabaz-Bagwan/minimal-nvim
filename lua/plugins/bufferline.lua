vim.pack.add({ {src = "https://github.com/akinsho/bufferline.nvim" }})
require("bufferline").setup({
  options = {
    themable = true,
    offsets = {
      { filetype = "NvimTree", highlight = "NvimTreeNormal" },
    },
  },
})

vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "buffer goto next", nowait = true })
vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "buffer goto prev", nowait = true })
vim.keymap.set("n", "<leader>xa","<cmd>BufferLineCloseOthers<cr>", { desc = "buffer close others", nowait = true })
