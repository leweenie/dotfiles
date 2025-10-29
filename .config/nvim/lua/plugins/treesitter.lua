return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        modules = {},
        ignore_install = {},
        ensure_installed = {
          "python",
          "css",
          "html",
          "c"
        },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
