vim.pack.add({ {src = "https://github.com/stevearc/conform.nvim" }})
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    cpp = { "clang-format" },
    c = { "clang-format" },
  },
})
vim.keymap.set({ "n", "x" }, "<leader>fm", function() require("conform").format { lsp_fallback = true } end, { desc = "general format file" })
