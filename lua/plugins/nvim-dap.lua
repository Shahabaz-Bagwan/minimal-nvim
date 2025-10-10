vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
})

local dap = require("dap")
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local map = vim.keymap.set

map("n", "<leader>dt", ':lua require("dapui").toggle()<cr>', { desc = "toggle debugging ui", silent = true })

map("n", "<F9>", ":DapToggleBreakpoint<cr>", { desc = "add breakpoint", silent = true })

map("n", "<F5>", ":DapContinue<cr>", { desc = "continue debugging", silent = true })

map("n", "<F6>", ":DapPause<cr>", { desc = "puase debugging", silent = true })

map("n", "S-<F5>", ":DapTerminate<cr>", { desc = "Stop debugging", silent = true })

map("n", "<F10>", ":DapStepOver<cr>", { desc = "Step over", silent = true })

map("n", "<F11>", ":DapStepInto<cr>", { desc = "Step Into", silent = true })

map("n", "S-<F11>", ":DapStepOut<cr>", { desc = "Step Into", silent = true })
