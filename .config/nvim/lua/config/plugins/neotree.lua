return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        buffers = {
          leave_dirs_open = true,
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          bind_to_cwd = false,
        },
      })
    end,
  },
}
