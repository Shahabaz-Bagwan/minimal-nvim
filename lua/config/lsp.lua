-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/nvim/lsp/lua_ls.lua for lua_ls, for example.
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")

local on_attach = function(ev)
	vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
	vim.opt.completeopt = { "menuone", "noinsert", "fuzzy" }
	vim.keymap.set("n", "grd", function()
		vim.lsp.buf.definition()
	end, { buffer = ev.buf, desc = "vim.lsp.buf.definition()" })

	vim.keymap.set("n", "grD", function()
		vim.lsp.buf.declaration()
	end, { buffer = ev.buf, desc = "vim.lsp.buf.declaration()" })

	local map = vim.keymap.set

	map("n", "gri", "<cmd>Pick lsp scope='implementation'<CR>", { desc = "go to implementation" })
	map("n", "grr", "<cmd>Pick lsp scope='references'<CR>", { desc = "go to references" })
	map("n", "grt", "<cmd>Pick lsp scope='type_definition'<CR>", { desc = "go to type_definition" })
	map("n", "gO", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "find document_symbol" })
	map("n", "grw", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "find workspace_symbol" })
	map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
	map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

	_G.cr_action = function()
		-- If there is selected item in popup, accept it with <C-y>
		if vim.fn.complete_info()["selected"] ~= -1 then
			return "\25"
		end
		-- Fall back to plain `<CR>`. You might want to customize according
		-- to other plugins. For example if 'mini.pairs' is set up, replace
		-- next line with `return MiniPairs.cr()`
		-- return "\r"
		return "v:lua.MiniPairs.cr()"
	end

	vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })
	vim.keymap.set("i", "<CR>", function()
		return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
	end, { expr = true })

	vim.keymap.set("i", "<C-Space>", function()
		vim.lsp.completion.get()
	end)
end

vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })

local cap = require("mini.completion").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = cap })

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅙",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
	underline = true,
	float = { border = "single" },
})
