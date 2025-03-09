return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
			})

			-- navigation
			vim.keymap.set("n", "<leader>n", function()
				if vim.wo.diff then
					vim.cmd.normal({ "<leader>n", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			vim.keymap.set("n", "<leader>p", function()
				if vim.wo.diff then
					vim.cmd.normal({ "<leader>p", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- preview changes
			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
		end,
	},
}
