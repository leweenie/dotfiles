return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      require("tokyonight").setup({
        -- on_highlights = function(hl, c)
        -- local prompt = "#2d3149"
        -- hl.TelescopeNormal = {
        -- 	bg = c.none,
        -- 	fg = c.fg_dark,
        -- }
        -- hl.TelescopeBorder = {
        -- 	bg = c.none,
        -- 	fg = c.bg_dark,
        -- }
        -- hl.TelescopePromptNormal = {
        -- 	bg = c.none,
        -- }
        -- hl.TelescopePromptBorder = {
        -- 	bg = c.none,
        -- 	fg = prompt,
        -- }
        -- hl.TelescopePromptTitle = {
        -- 	bg = c.none,
        -- 	fg = prompt,
        -- }
        -- hl.TelescopePreviewTitle = {
        -- 	bg = c.none,
        -- 	fg = c.bg_dark,
        -- }
        -- hl.TelescopeResultsTitle = {
        -- 	bg = c.none,
        -- 	fg = c.bg_dark,
        -- }
        -- end,
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd("colorscheme tokyonight-storm")
    end,
  },
}
