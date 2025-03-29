return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Bubbles config for lualine
      -- Author: lokesh-krishna MIT license, see LICENSE for more details. stylua: ignore
      local colors = {
        blue = "none",
        cyan = "none",
        black = "#908CAA",
        white = "none",
        red = "none",
        violet = "none",
        grey = "none",
      }

      local mode_lower = function()
        local mode = vim.fn.mode()
        local modes = {
          ["n"] = "normal",
          ["i"] = "insert",
          ["v"] = "visual",
          ["V"] = "visual line",
          [""] = "visual block",
          ["c"] = "command",
          ["r"] = "replace",
          ["t"] = "terminal",
        }
        vim.g.lower_mode = (modes[mode] or mode):lower()
      end

      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.white },
          b = { fg = colors.black, bg = colors.white },
          c = { fg = colors.black, bg = colors.white },
        },

        insert = { a = { fg = colors.black, bg = colors.white } },
        visual = { a = { fg = colors.black, bg = colors.white } },
        replace = { a = { fg = colors.black, bg = colors.white } },

        inactive = {
          a = { fg = colors.black, bg = colors.white },
          b = { fg = colors.black, bg = colors.white },
          c = { fg = colors.black, bg = colors.white },
        },
      }

      require("lualine").setup({
        options = {
          theme = bubbles_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              "filename",
              padding = 0,
              path = 1,
            },
          },
          lualine_b = {},

          lualine_c = {
            "%=", --[[ add your center components here in place of this comment ]]
          },
          lualine_x = {},
          lualine_y = {
            "diagnostics",
            "diff",
            -- "filetype",
            { "location" },
          },
          lualine_z = {
            { "progress", padding = { left = 5, right = 0 } },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
