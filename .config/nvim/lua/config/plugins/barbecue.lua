return {
  {
    "utilyre/barbecue.nvim",
    enabled = true,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    config = function()
      require("barbecue").setup({
        theme = {
          -- normal = { bg = "#000000" },
          -- normal = { bg = "#1c1c1c" },
          -- normal = { bg = "#090909" },
          normal = { bg = "#262626" },
        },
      })
    end,
  },
}
