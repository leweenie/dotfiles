return {
  "NTBBloodbath/color-converter.nvim",
  config = function()
    require('color-converter').setup({
      rgb_pattern = "rgb([r], [g], [b])",
      rgba_pattern = "rgb([r], [g], [b], / [a]%)",
    })
  end,
  opts = {},
}
