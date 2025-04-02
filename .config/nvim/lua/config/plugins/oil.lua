return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    opts = {},
    dependencies = { {
      "echasnovski/mini.icons",
      opts = {},
    } },

    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = false,
        },
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-v>"] = { "actions.select", opts = { vertical = true } },
          ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = { "actions.select", opts = { tab = true } },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = { "actions.close", mode = "n" },
          ["<C-l>"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },

        float = {
          padding = 2,
          max_width = 125,
          max_height = 25,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          get_win_title = nil,
          preview_split = "auto",
          override = function(conf)
            return conf
          end,
        },

        confirmation = {
          -- max_width = ,
          -- max_height = vim.o.columns,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
      })
    end,
  },
}
