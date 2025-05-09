return {
  {
    "Chaitanyabsprip/present.nvim",
    opts = {},
    config = function()
      require("present").setup({
        {
          default_mappings = true,
          kitty = {
            normal_font_size = 12,
            zoomed_font_size = 28,
          },
        },
      })
    end,
  },
}
