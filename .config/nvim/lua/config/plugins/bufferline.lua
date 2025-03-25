return {
	{
		"akinsho/bufferline.nvim",
		priority = -1,
		enabled = false,
		config = function()
			require("bufferline").setup({
				options = {
					indicator = {
						style = "none",
					},
					show_close_icon = false,
					color_icons = true,
					diagnostics = "nvim_lsp",
					-- tab_size = 25,
					-- max_name_length = 15,
				},
			})
			vim.keymap.set("n", "<leader>e", "<cmd>BufferLinePick<cr>", { noremap = true, silent = true })
		end,
	},
}
