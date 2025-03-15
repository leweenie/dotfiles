return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<cr>")
      require("toggleterm").setup({
        direction = "float",
        size = 10,
        open_mapping = [[<c-\>]],
      })
    end,
  },
}
