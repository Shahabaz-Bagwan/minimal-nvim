-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
			vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy" }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

			vim.keymap.set("n", "grd", function()
				vim.lsp.buf.definition()
			end, { buffer = ev.buf, desc = "vim.lsp.buf.definition()" })

			vim.keymap.set("n", "grD", function()
				vim.lsp.buf.definition()
			end, { buffer = ev.buf, desc = "vim.lsp.buf.declaration()" })

			local map = vim.keymap.set

			map("n", "gri", "<cmd>Pick lsp scope='implementation'<CR>", { desc = "go to implementation" })
			map("n", "grr", "<cmd>Pick lsp scope='references'<CR>", { desc = "go to references" })
			map("n", "grt", "<cmd>Pick lsp scope='type_definition'<CR>", { desc = "go to type_definition" })
			map("n", "grs", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "find document_symbol" })
			map("n", "grw", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "find workspace_symbol" })

			vim.keymap.set("i", "<CR>", function()
				return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
			end, { expr = true })

			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end)
		end
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}
vim.lsp.config("*", { capabilities = capabilities })
-- vim.lsp.config("*", { capabilities = "v:lua.MiniCompletion.get_lsp_capabilities()" })

-- Diagnostics
vim.diagnostic.config({
	virtual_text = { prefix = "" },
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
