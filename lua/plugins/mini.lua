vim.pack.add({
  { src = 'https://github.com/echasnovski/mini.nvim', branch = 'stable' }
})
require('mini.indentscope').setup(
    { symbol = "│", options = { try_as_border = true }}
)
require('mini.icons').setup()
require('mini.files').setup()

vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open()
end, {desc= "open mini files"})

require('mini.statusline').setup()
require('mini.cursorword').setup()

-- vim.pack.add({
--   { src = 'https://github.com/rafamadriz/friendly-snippets' },
--   { src = 'https://github.com/L3MON4D3/LuaSnip' },
-- })

-- require('LuaSnip')
-- require('mini.snippets').setup()
require('mini.ai').setup()
require('mini.surround').setup()
