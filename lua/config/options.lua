local opt = vim.opt
local o = vim.o
local g = vim.g
-- options
vim.o.termguicolors = true
--------------------------------------------------------------------------------
-- Relative and absolute line numbers combined
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Cursorline
vim.opt.cursorline = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions
vim.opt.inccommand = "split"

-- Text wrapping
vim.opt.wrap = true
vim.opt.breakindent = true

-- Tabstops
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
o.smartindent = true

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

-- Set the default border for all floating windows
vim.opt.winborder = "rounded"
-- custom options
vim.scriptencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/bin/python3"

vim.o.scrolloff = 8
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
vim.o.swapfile = false
vim.o.spelllang = "en_us,de_de"
vim.o.foldmethod = "expr"
vim.o.fixendofline = true
vim.o.endofline = true
vim.o.foldcolumn = "1"
vim.o.relativenumber = true
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"

o.clipboard = "unnamedplus"
o.cursorlineopt = "number"

opt.fillchars = { eob = " " }

-- reload file if it is changed outside
o.autoread = true

-- Numbers
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

o.timeoutlen = 400

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
-- g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
