-- keymap
--------------------------------------------------------------------------------
-- Navigate visual lines
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Navigate down (visual line)" })
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Navigate up (visual line)" })
vim.keymap.set({ "n", "x" }, "<Down>", "gj",
  { desc = "Navigate down (visual line)" })
vim.keymap.set({ "n", "x" }, "<Up>", "gk", { desc = "Navigate up (visual line)" })
vim.keymap.set("i", "<Down>", "<C-\\><C-o>gj",
  { desc = "Navigate down (visual line)" })
vim.keymap.set("i", "<Up>", "<C-\\><C-o>gk",
  { desc = "Navigate up (visual line)" })

vim.keymap.set({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { desc = "Move down", expr = true })
vim.keymap.set({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { desc = "Move up", expr = true })
vim.keymap.set({ "n", "v" }, "Up", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { desc = "Move up", expr = true })
vim.keymap.set(
  { "n", "v" },
  "Down",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { desc = "Move down", expr = true }
)

-- Move Lines
vim.keymap.set({ "n", "x" }, "<M-S-Up>", ":move -2<cr>",
  { desc = "Move Line Up" })
vim.keymap.set({ "n", "x" }, "<M-S-Down>", ":move +1<cr>",
  { desc = "Move Line Down" })
vim.keymap.set("i", "<M-S-Up>", "<C-o>:move -2<cr>", { desc = "Move Line Up" })
vim.keymap.set("i", "<M-S-Down>", "<C-o>:move +1<cr>",
  { desc = "Move Line Down" })

-- Easier interaction with the system clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y',
  { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p',
  { desc = "Paste from system clipboard after the cursor position" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P',
  { desc = "Paste from system clipboard before the cursor position" })

-- Navigating buffers
vim.keymap.set("n", "<leader>bb", "<C-^>",
  { desc = "Switch to alternate buffer" })
vim.keymap.set("n", "<TAB>", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "S-<TAB>", ":bprevious<cr>", { desc = "Previous buffer" })

-- Ctrl-L redraws the screen by default. Now it will also toggle search highlighting.
vim.keymap.set("n", "<C-l>", ":set hlsearch!<cr><C-l>",
  { desc = "Toggle search highlighting" })

-- Toggle visible whitespace characters
vim.keymap.set("n", "<leader>l", ":listchars!<cr>",
  { desc = "Toggle [l]istchars" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" })

-- Quickly source current file / execute Lua code
vim.keymap.set("n", "<leader>xx", "<Cmd>source %<CR>",
  { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", "<Cmd>:.lua<CR>",
  { desc = "Lua: execute current line" })
vim.keymap.set("v", "<leader>x", "<Cmd>:lua<CR>",
  { desc = "Lua: execute current selection" })
