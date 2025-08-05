local map = vim.keymap.set
-- keymap
--------------------------------------------------------------------------------
-- Navigate visual lines
map({ "n", "x" }, "j", "gj", { desc = "Navigate down (visual line)" })
map({ "n", "x" }, "k", "gk", { desc = "Navigate up (visual line)" })
map({ "n", "x" }, "<Down>", "gj", { desc = "Navigate down (visual line)" })

map({ "n", "v" }, ";", ":", { desc = "Enter cmd" })

map({ "n", "x" }, "<Up>", "gk", { desc = "Navigate up (visual line)" }) map("i", "<Down>", "<C-\\><C-o>gj", { desc = "Navigate down (visual line)" })

map("i", "<Up>", "<C-\\><C-o>gk", { desc = "Navigate up (visual line)" })

map({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map({ "n", "v" }, "Up", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map( { "n", "v" }, "Down", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down", silent = true })
map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move Line Up", silent = true })

-- Toggle visible whitespace characters
map("n", "<leader>l", ":set list!<cr>", { desc = "Toggle [l]istchars", silent = true })

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line", silent = true })
map("i", "<C-e>", "<End>", { desc = "move end of line", silent = true })
map("i", "<C-h>", "<Left>", { desc = "move left", silent = true })
map("i", "<C-l>", "<Right>", { desc = "move right", silent = true })
map("i", "<C-j>", "<Down>", { desc = "move down", silent = true })
map("i", "<C-k>", "<Up>", { desc = "move up", silent = true })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up", silent = true })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights", silent = true })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file", silent = true })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file", silent = true })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number", silent = true })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number", silent = true })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new", silent = true })


map("n", "<leader>x", "<cmd>bd<cr>", { desc = "buffer close", silent = true })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

