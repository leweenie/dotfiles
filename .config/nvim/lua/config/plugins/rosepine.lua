return {
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "base" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        },
        styles = {
          transparency = true,
        },
      })
      vim.cmd.colorscheme("rose-pine-main")
    end,
  },
}
