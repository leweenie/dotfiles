return {
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup({
        transparent = true,
      })
      -- vim.cmd("colorscheme vscode")
    end
  },

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
      vim.cmd('colorscheme tokyonight')
    end
  }

  -- {
  --   "vague2k/vague.nvim",
  --   config = function()
  --     require("vague").setup({
  --       transparent = true, -- don't set background
  --       style = {
  --         -- "none" is the same thing as default. but "italic" and "bold" are also valid options
  --         boolean = "none",
  --         number = "none",
  --         float = "none",
  --         error = "none",
  --         comments = "italic",
  --         conditionals = "none",
  --         functions = "none",
  --         headings = "none",
  --         operators = "none",
  --         strings = "none",
  --         variables = "none",
  --
  --         -- keywords
  --         keywords = "none",
  --         keyword_return = "none",
  --         keywords_loop = "none",
  --         keywords_label = "none",
  --         keywords_exception = "none",
  --
  --         -- builtin
  --         builtin_constants = "none",
  --         builtin_functions = "none",
  --         builtin_types = "none",
  --         builtin_variables = "none",
  --       },
  --       -- plugin styles where applicable
  --       -- make an issue/pr if you'd like to see more styling options!
  --       plugins = {
  --         cmp = {
  --           match = "bold",
  --           match_fuzzy = "bold",
  --         },
  --         dashboard = {
  --           footer = "italic",
  --         },
  --         lsp = {
  --           diagnostic_error = "bold",
  --           diagnostic_hint = "none",
  --           diagnostic_info = "italic",
  --           diagnostic_warn = "bold",
  --         },
  --         neotest = {
  --           focused = "bold",
  --           adapter_name = "bold",
  --         },
  --         telescope = {
  --           match = "bold",
  --         },
  --       },
  --       -- override colors
  --       colors = {
  --         bg = "#141415",
  --         fg = "#cdcdcd",
  --         floatborder = "#878787",
  --         -- line = "#252530",
  --         line = "none",
  --         comment = "#606079",
  --         builtin = "#b4d4cf",
  --         func = "#c48282",
  --         string = "#e8b589",
  --         number = "#e0a363",
  --         property = "#c3c3d5",
  --         constant = "#aeaed1",
  --         parameter = "#bb9dbd",
  --         visual = "#333738",
  --         error = "#df6882",
  --         warning = "#f3be7c",
  --         hint = "#7e98e8",
  --         operator = "#90a0b5",
  --         keyword = "#6e94b2",
  --         type = "#9bb4bc",
  --         search = "#405065",
  --         plus = "#8cb66d",
  --         delta = "#f3be7c",
  --       },
  --     })
  --     vim.cmd("colorscheme vague")
  --   end
  -- },

  -- {
  --   "rrethy/base16-nvim",
  --   config = function()
  --     require('base16-colorscheme').setup({
  --       base00 = 'none',
  --       -- base01 = '#121212',
  --       base01 = 'none',
  --       base02 = '#222222',
  --       base03 = '#333333',
  --       base04 = '#999999',
  --       -- base05 = '#c1c1c1',
  --       base06 = '#999999',
  --       base07 = '#c1c1c1',
  --       base08 = '#5f8787',
  --       base09 = '#ababab',
  --       base0a = '#8c7f70',
  --       base0b = '#9a8d7f',
  --       base0c = '#ababab',
  --       base0d = '#888888',
  --       base0e = '#999999',
  --       base0f = '#444444',
  --     })
  --     local color = require('base16-colorscheme').colors.base01
  --     -- local color = require('base16-colorscheme')
  --   end
  -- },
  --
  -- {
  --   "rrethy/base16-nvim",
  --   config = function()
  --     require('base16-colorscheme').setup({
  --       base00 = 'none',
  --       -- base01 = '#121212',
  --       base01 = 'none',
  --       base02 = '#222222',
  --       base03 = '#333333',
  --       base04 = '#999999',
  --       -- base05 = '#c1c1c1',
  --       base06 = '#999999',
  --       base07 = '#c1c1c1',
  --       base08 = '#5f8787',
  --       base09 = '#ababab',
  --       base0a = '#a06666',
  --       base0b = '#dd9998',
  --       base0c = '#ababab',
  --       base0d = '#888888',
  --       base0e = '#999999',
  --       base0f = '#444444',
  --     })
  --     local color = require('base16-colorscheme').colors.base01
  --   end
  -- },

  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_transparent_background = 2
  --     vim.g.gruvbox_material_float_style = 'dim'
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end
  -- }
}
