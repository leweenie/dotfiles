return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      -- vim.cmd("colorscheme tokyonight-storm")
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
      })
      vim.cmd("colorscheme rose-pine-main")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "low"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        contrast = {
          terminal = false,
          sidebars = false,
          floating_windows = false,
          cursor_line = false,
          lsp_virtual_text = false,
          non_current_windows = true,
          filetypes = {},
        },
        styles = {
          comments = { --[[ italic = true ]]
          },
          strings = { --[[ bold = true ]]
          },
          keywords = { --[[ underline = true ]]
          },
          functions = { --[[ bold = true, undercurl = true ]]
          },
          variables = {},
          operators = {},
          types = {},
        },
        plugins = {
          "dashboard",
          "flash",
          "gitsigns",
          "harpoon",
          "indent-blankline",
          "mini",
          "nvim-web-devicons",
          "telescope",
        },
        disable = {
          colored_cursor = false,
          borders = false,
          background = true,
          term_colors = false,
          eob_lines = false,
        },
        high_visibility = {
          lighter = false,
          darker = true,
        },
        lualine_style = "default",
        async_loading = true,
        custom_colors = nil,
        custom_highlights = {},
      })
      -- vim.cmd("colorscheme material-deep-ocean")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.o.background = "dark"
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        underline_links = true,
        isable_nvimtree_bg = true,
        erminal_colors = true,
        olor_overrides = {
          vscLineNumber = "#3B3F51",
        },
        group_overrides = {
          Cursor = {
            fg = c.vscDarkBlue,
            bold = true,
          },
        },
      })
      -- vim.cmd.colorscheme("vscode")
    end,
  },
  -- {
  --   "ramojus/mellifluous.nvim",
  --   config = function()
  --     require("mellifluous").setup({})
  --     vim.cmd("colorscheme mellifluous")
  --     vim.cmd("Mellifluous toggle_transparency")
  --     vim.api.nvim_set_hl(0, "Comment", { fg = "#5B5B5B", italic = true })
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "mocha",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false,       -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,         -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,       -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,         -- Force no italic
        no_bold = false,           -- Force no bold
        no_underline = false,      -- Force no underline
        styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
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
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
