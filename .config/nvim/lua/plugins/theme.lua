return {
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
        bold = true,
        italic = true,
        style = {
          boolean = "bold",
          number = "none",
          float = "none",
          error = "bold",
          comments = "italic",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "italic",
          variables = "none",

          keywords = "none",
          keyword_return = "italic",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          builtin_constants = "bold",
          builtin_functions = "none",
          builtin_types = "bold",
          builtin_variables = "none",
        },

        plugins = {
          cmp = {
            match = "bold",
            match_fuzzy = "bold",
          },
          dashboard = {
            footer = "italic",
          },
          lsp = {
            diagnostic_error = "none",
            diagnostic_hint = "none",
            diagnostic_info = "none",
            diagnostic_ok = "none",
            diagnostic_warn = "none",
          },
          neotest = {
            focused = "bold",
            adapter_name = "bold",
          },
          telescope = {
            match = "bold",
          },
        },

        on_highlights = function(highlights, colors) end,
        colors = {
          bg = "#141415",
          inactiveBg = "none",
          fg = "#cdcdcd",
          floatBorder = "#878787",
          line = "#252530",
          comment = "#606079",
          builtin = "#b4d4cf",
          func = "#c48282",
          string = "#e8b589",
          number = "#e0a363",
          property = "#c3c3d5",
          constant = "#aeaed1",
          parameter = "#bb9dbd",
          visual = "#333738",
          error = "#d8647e",
          warning = "#f3be7c",
          hint = "#7e98e8",
          operator = "#90a0b5",
          keyword = "#6e94b2",
          type = "#9bb4bc",
          search = "#405065",
          plus = "#7fa563",
          delta = "#f3be7c",
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        float = {
          transparent = true,
          solid = false,
        },
        show_end_of_buffer = false,
        term_colors = false,
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
          -- miscs = {},
        },
        lsp_styles = {
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
