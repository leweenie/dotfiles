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
          normal = { bg = "NONE" },
          ellipsis = { bg = "NONE" },
          separator = { bg = "NONE" },
          modified = { bg = "NONE" },
          dirname = { bg = "NONE" },
          basename = { bg = "NONE" },
          context = { bg = "NONE" },
        },
      })

      local function clear_barbecue_highlights()
        for _, group in ipairs({
          "BarbecueNormal",
          "BarbecueEllipsis",
          "BarbecueSeparator",
          "BarbecueModified",
          "BarbecueDirname",
          "BarbecueBasename",
          "BarbecueContext",
        }) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE" })
        end
        vim.cmd([[
          highlight WinBar        guibg=NONE
          highlight WinBarNC      guibg=NONE
          highlight TabLineFill   guibg=NONE
        ]])
      end

      vim.api.nvim_create_augroup("TransparentBarbecue", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = "TransparentBarbecue",
        callback = clear_barbecue_highlights,
      })

      clear_barbecue_highlights()
    end,
  },
}
