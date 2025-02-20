return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      require('tokyonight').setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd('colorscheme tokyonight-storm')
    end
  },
}
