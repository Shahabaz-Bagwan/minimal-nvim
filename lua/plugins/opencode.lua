vim.pack.add({
	{
		src = "https://github.com/NickvanDyke/opencode.nvim",
	},
})

require("opencode").setup()

vim.keymap.set("n", "<leader>ot", function()
	require("opencode").toggle()
end, { desc = "Toggle embedded opencode" })

vim.keymap.set("n", "<leader>oa", function()
	require("opencode").ask()
end, { desc = "Ask opencode" })

vim.keymap.set("n", "<leader>oa", function()
	require("opencode").ask("@selection: ")
end, { desc = "Ask opencode about selection" })

vim.keymap.set("n", "<leader>op", function()
	require("opencode").select_prompt()
end, { desc = "Select prompt" })

vim.keymap.set("n", "<leader>on", function()
	require("opencode").command("session_new")
end, { desc = "New session" })

vim.keymap.set("n", "<leader>oy", function()
	require("opencode").command("messages_copy")
end, { desc = "Copy last message" })

vim.keymap.set("n", "<S-C-u>", function()
	require("opencode").command("messages_half_page_up")
end, { desc = "Scroll messages up" })

vim.keymap.set("n", "<S-C-d>", function()
	require("opencode").command("messages_half_page_down")
end, { desc = "Scroll messages down" })
