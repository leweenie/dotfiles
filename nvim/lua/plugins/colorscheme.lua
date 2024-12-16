return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  init = function()
    require("rose-pine").setup({
      variant = "mocha",
      styles = {
        transparency = true,
        disable_background = true,
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
