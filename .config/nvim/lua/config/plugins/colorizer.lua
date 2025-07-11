return {
  {
    "norcalli/nvim-colorizer.lua",
    enabled = true,
    config = function()
      vim.cmd("set termguicolors")
      require("colorizer").setup()
      DEFAULT_OPTIONS = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
      }
    end,
  },
  {
    "ziontee113/color-picker.nvim",
    config = function()
      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
      vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

      -- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
      -- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

      require("color-picker").setup({ -- for changing icons & mappings
        -- ["icons"] = { "ﱢ", "" },
        -- ["icons"] = { "ﮊ", "" },
        -- ["icons"] = { "", "ﰕ" },
        -- ["icons"] = { "", "" },
        -- ["icons"] = { "", "" },
        ["icons"] = { "ﱢ", "" },
        ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
        ["keymap"] = {          -- mapping example:
          ["U"] = "<Plug>ColorPickerSlider5Decrease",
          ["O"] = "<Plug>ColorPickerSlider5Increase",
        },
        ["background_highlight_group"] = "Normal",  -- default
        ["border_highlight_group"] = "FloatBorder", -- default
        ["text_highlight_group"] = "Normal",        --default
      })

      vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
    end,
  },
}
