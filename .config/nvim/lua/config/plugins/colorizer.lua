return {
  {
    "norcalli/nvim-colorizer.lua",
    enabled = true,
    config = function()
      vim.cmd("set termguicolors")
      require("colorizer").setup()
      DEFAULT_OPTIONS = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
      }
    end,
  },
}
