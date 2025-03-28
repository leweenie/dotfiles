return {
  {
    "akinsho/bufferline.nvim",
    priority = -1,
    enabled = true,
    config = function()
      local bufferline = require("bufferline")
      require("bufferline").setup({
        options = {
          separator_style = "thin",
          style_preset = {
            -- bufferline.style_preset.no_italic,
            -- bufferline.style_preset.no_bold,
          },
          indicator = {
            style = "none",
          },
          pick = {
            alphabet = "1234567",
          },
          show_close_icon = true,
          color_icons = true,
          diagnostics = "nvim_lsp",
          -- tab_size = 25,
          -- max_name_length = 15,
        },
      })
      -- vim.keymap.set("n", "<leader>e", "<cmd>BufferLinePick<cr>", { noremap = true, silent = true })
    end,
  },
}
