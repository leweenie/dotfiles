return {
  -- {
  --   "vague2k/vague.nvim",
  --   config = function()
  --     require("vague").setup({
  --       colors = {
  --         bg = "none",
  --         fg = "#cdcdcd",
  --         floatBorder = "#878787",
  --         line = "#282830",
  --         comment = "#646477",
  --         builtin = "#bad1ce",
  --         func = "#be8c8c",
  --         string = "#deb896",
  --         number = "#d2a374",
  --         property = "#c7c7d4",
  --         constant = "#b4b4ce",
  --         parameter = "#b9a3ba",
  --         visual = "#363738",
  --         error = "#d2788c",
  --         warning = "#e6be8c",
  --         hint = "#8ca0dc",
  --         operator = "#96a3b2",
  --         keyword = "#7894ab",
  --         type = "#a1b3b9",
  --         search = "#465362",
  --         plus = "#8faf77",
  --         delta = "#e6be8c",
  --       },
  --     })
  --   end
  -- },
  {
    "RRethy/base16-nvim",
    config = function()
      require('base16-colorscheme').setup({
        base00 = 'none',
        -- base01 = '#121212',
        base01 = 'none',
        base02 = '#222222',
        base03 = '#333333',
        base04 = '#999999',
        -- base05 = '#C1C1C1',
        base06 = '#999999',
        base07 = '#C1C1C1',
        base08 = '#5F8787',
        base09 = '#ABABAB',
        base0A = '#8C7F70',
        base0B = '#9A8D7F',
        base0C = '#ABABAB',
        base0D = '#888888',
        base0E = '#999999',
        base0F = '#444444',
      })
      local color = require('base16-colorscheme').colors.base01
    end
  },
}
