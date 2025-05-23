return {
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",
  --       transparent = true,
  --       styles = {
  --         sidebars = "transparent",
  --         floats = "transparent",
  --       },
  --     })
  --     vim.cmd("colorscheme tokyonight")
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    name = "folkeTokyonight",
    -- priority = 1000,
    config = function()
      local transparent = true
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,

        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = transparent and colors.none or bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })
      -- vim.cmd("colorscheme tokyonight")
      -- NOTE: Auto switch to tokyonight for markdown files only
      -- vim.api.nvim_create_autocmd("FileType", {
      --     pattern = { "markdown" },
      --     callback = function()
      --         -- Ensure the theme switch only happens once for a buffer
      --         local buffer = vim.api.nvim_get_current_buf()
      --         if not vim.b[buffer].tokyonight_applied then
      --             if vim.fn.expand("%:t") ~= "" and vim.api.nvim_buf_get_option(0, "buftype") ~= "nofile" then
      --                 vim.cmd("colorscheme tokyonight")
      --             end
      --             vim.b[buffer].tokyonight_applied = true
      --         end
      --     end,
      -- })
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
          Visual = { bg = "#0A64AC" },
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
      vim.g.gruvbox_material_transparent_background = 1
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
  -- -- {
  -- --   "ramojus/mellifluous.nvim",
  -- --   config = function()
  -- --     require("mellifluous").setup({})
  -- --     vim.cmd("colorscheme mellifluous")
  -- --     vim.cmd("Mellifluous toggle_transparency")
  -- --     vim.api.nvim_set_hl(0, "Comment", { fg = "#5B5B5B", italic = true })
  -- --   end,
  -- -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
          light = "mocha",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
        term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,             -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,           -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,             -- Force no italic
        no_bold = false,               -- Force no bold
        no_underline = false,          -- Force no underline
        styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },     -- Change the style of comments
          conditionals = {},
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
          barbecue = {
            dim_dirname = true, -- directory name is dimmed by default
            bold_basename = true,
            dim_context = false,
            alt_background = false,
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
        custom_highlights = function(colors)
          return {
            LineNr = { fg = "#5F5F87" },
          }
        end,
      })

      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("kanagawa-paper").setup({
        -- enable undercurls for underlined text
        undercurl = true,
        -- transparent background
        transparent = true,
        -- highlight background for the left gutter
        gutter = false,
        -- background for diagnostic virtual text
        diag_background = true,
        -- dim inactive windows. Disabled when transparent
        dim_inactive = false,
        -- set colors for terminal buffers
        terminal_colors = true,
        -- cache highlights and colors for faster startup.
        -- see Cache section for more details.
        cache = false,

        styles = {
          -- style for comments
          comment = { italic = true },
          -- style for functions
          functions = { italic = false },
          -- style for keywords
          keyword = { italic = false, bold = false },
          -- style for statements
          statement = { italic = false, bold = false },
          -- style for types
          type = { italic = false },
        },
        -- override default palette and theme colors
        colors = {
          palette = {},
          theme = {
            ink = {},
            canvas = {},
          },
        },
        -- adjust overall color balance for each theme [-1, 1]
        color_offset = {
          ink = { brightness = 0, saturation = 0 },
          canvas = { brightness = 0, saturation = 0 },
        },
        overrides = function(colors)
          return {}
        end,

        plugins = {},
      })
      -- vim.cmd("colorscheme kanagawa-paper")
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.moonflyTransparent = true
      -- vim.cmd("colorscheme moonfly")
    end,
  },
}
