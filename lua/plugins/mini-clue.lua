require("mini.clue").setup({
	-- Show window immediately
	delay = 0,
	window = {
		config = function()
			local height, width, starts, ends
			local win_width = vim.o.columns
			local win_height = vim.o.lines

			if win_height <= 25 then
				height = math.min(win_height, 18)
				width = win_width
				starts = 1
				ends = win_height
			else
				width = math.floor(win_width * 0.9) -- 50%
				height = math.floor(win_height * 0.2) -- 30%
				starts = math.floor((win_width - width) / 2)
				ends = math.floor(win_height)
			end

			return {
				col = starts,
				row = ends,
				height = height,
				width = width,
				style = "minimal",
			}
		end,

		-- String to use as cursor in prompt
		prompt_caret = "|",

		-- String to use as prefix in prompt
		prompt_prefix = "",
	},
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		require("mini.clue").gen_clues.builtin_completion(),
		require("mini.clue").gen_clues.g(),
		require("mini.clue").gen_clues.marks(),
		require("mini.clue").gen_clues.registers(),
		require("mini.clue").gen_clues.windows(),
		require("mini.clue").gen_clues.z(),
	},
})
