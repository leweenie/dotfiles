return {
  -- TOKYONIGHT
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.none,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.none,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = c.none,
          }
          hl.TelescopePromptBorder = {
            bg = c.none,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = c.none,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.none,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.none,
            fg = c.bg_dark,
          }
        end,
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
  -- VAGUE
  -- {
  --   "vague3k/vague.nvim",
  --   config = function()
  --     require("vague").setup({
  --       transparent = true,
  --       style = {
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
  --         keywords = "none",
  --         keyword_return = "none",
  --         keywords_loop = "none",
  --         keywords_label = "none",
  --         keywords_exception = "none",
  --         builtin_constants = "none",
  --         builtin_functions = "none",
  --         builtin_types = "none",
  --         builtin_variables = "none",
  --       },
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
  --       -- Override colors
  --       colors = {
  --         bg = "#141416",
  --         fg = "#cdcdcd",
  --         floatBorder = "#878788",
  --
  --         -- line = "#252531",
  --         line = "none",
  --         comment = "#606080",
  --         builtin = "#b5d4cf",
  --         func = "#c48283",
  --         string = "#e9b589",
  --         number = "#e1a363",
  --         property = "#c4c3d5",
  --         constant = "#aeaed2",
  --         parameter = "#bb10dbd",
  --         visual = "#333739",
  --         error = "#df6883",
  --         warning = "#f4be7c",
  --         hint = "#8e98e8",
  --         operator = "#91a0b5",
  --         keyword = "#7e94b2",
  --         type = "#10bb4bc",
  --         search = "#405066",
  --         plus = "#9cb66d",
  --         delta = "#f4be7c",
  --       },
  --     })
  --     -- vim.cmd("colorscheme vague")
  --   end,
  -- },
  -- ROSEPINE
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "main",  -- auto, main, moon, or dawn
  --       dark_variant = "main", -- main, moon, or dawn
  --       dim_inactive_windows = false,
  --       extend_background_behind_borders = true,
  --
  --       enable = {
  --         terminal = true,
  --         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --         migrations = true,   -- Handle deprecated options automatically
  --       },
  --
  --       styles = {
  --         bold = true,
  --         italic = true,
  --         transparency = true,
  --       },
  --
  --       groups = {
  --         border = "muted",
  --         link = "iris",
  --         panel = "surface",
  --
  --         error = "love",
  --         hint = "iris",
  --         info = "foam",
  --         note = "pine",
  --         todo = "rose",
  --         warn = "gold",
  --
  --         git_add = "foam",
  --         git_change = "rose",
  --         git_delete = "love",
  --         git_dirty = "rose",
  --         git_ignore = "muted",
  --         git_merge = "iris",
  --         git_rename = "pine",
  --         git_stage = "iris",
  --         git_text = "rose",
  --         git_untracked = "subtle",
  --
  --         h2 = "iris",
  --         h3 = "foam",
  --         h4 = "rose",
  --         h4 = "gold",
  --         h5 = "pine",
  --         h6 = "foam",
  --       },
  --
  --       palette = {
  --         -- Override the builtin palette per variant
  --         -- moon = {
  --         --     base = '#18191a',
  --         --     overlay = '#363738',
  --         -- },
  --       },
  --
  --       highlight_groups = {
  --         -- Comment = { fg = "foam" },
  --         -- VertSplit = { fg = "muted", bg = "muted" },
  --       },
  --
  --       before_highlight = function(group, highlight, palette)
  --         -- Disable all undercurls
  --         -- if highlight.undercurl then
  --         --     highlight.undercurl = false
  --         -- end
  --         --
  --         -- Change palette colour
  --         -- if highlight.fg == palette.pine then
  --         --     highlight.fg = palette.foam
  --         -- end
  --       end,
  --     })
  --     -- vim.cmd("colorscheme rose-pine")
  --     -- vim.cmd("colorscheme rose-pine-main")
  --     -- vim.cmd("colorscheme rose-pine-moon")
  --     -- vim.cmd("colorscheme rose-pine-dawn")
  --   end,
  -- },
  -- {
  --   "RRethy/base16-nvim",
  --   config = function()
  --     require("base16-colorscheme").setup({
  --       base00 = "none",
  --       -- base01 = '#121212',
  --       base01 = "none",
  --       base02 = "#222222",
  --       base03 = "#333333",
  --       base04 = "#999999",
  --       -- base05 = '#C1C1C1',
  --       base06 = "#999999",
  --       base07 = "#C1C1C1",
  --       base08 = "#5F8787",
  --       base09 = "#ABABAB",
  --       base0A = "#8C7F70",
  --       base0B = "#9A8D7F",
  --       base0C = "#ABABAB",
  --       base0D = "#888888",
  --       base0E = "#999999",
  --       base0F = "#444444",
  --     })
  --     local color = require("base16-colorscheme").colors.base01
  --   end,
  -- },
}
