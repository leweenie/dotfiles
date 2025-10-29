return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", function()
      require("telescope.builtin").find_files({ hidden = true })
    end)
    vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
    vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
    vim.keymap.set("n", "<leader>fc", function()
      require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
    end)
    vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles)
    vim.keymap.set("n", "<leader>cs", function()
      require("telescope.builtin").colorscheme({ enable_preview = true })
    end)
  end,
}
