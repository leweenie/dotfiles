return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        modules = {},
        ignore_install = {},
        ensure_installed = {
          "c",
          "python",
          "css",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
        },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        additional_vim_regex_highlighting = true,
      })
    end,
  },
}
