return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "mocha",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = {},
          loops = {},
          functions = { "bold" },
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          noice = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          barbecue = {
            dim_dirname = true,
            bold_basename = true,
            dim_context = false,
            alt_background = false,
          },
        },
        custom_highlights = function()
          return {
            LineNr = { fg = "#5F5F87" },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
          bold = false,
          italic = false,
        },
        highlight_groups = {
          ColorColumn = { bg = "#1C1C21" },
          Normal = { bg = "none" },            -- Main background remains transparent
          Pmenu = { bg = "", fg = "#e0def4" }, -- Completion menu background
          PmenuThumb = { bg = "#9ccfd8" },     -- Scrollbar thumb
          Visual = { bg = "#87AFFF" },
        },
      })
      -- vim.cmd("colorscheme rose-pine-main")
      local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
      comment_hl.italic = true
      vim.api.nvim_set_hl(0, "Comment", comment_hl)
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
