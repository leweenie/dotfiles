return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-s>"] = actions.select_horizontal,
            },
            n = {
              ["<C-s>"] = actions.select_horizontal,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            hidden = true,
          },
          oldfiles = {
            theme = "dropdown",
          },
          help_tags = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "dropdown",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
          },
        },
      })

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files) -- find all files

      vim.keymap.set("n", "<leader>fc", function()                            -- config files
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)

      vim.keymap.set("n", "<leader>cs", function() -- colorscheme preview
        require("telescope.builtin").colorscheme({
          enable_preview = true,
        })
      end)

      vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles) -- recent files

      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags) -- help parsing

      vim.keymap.set("n", "<leader>fg", function()                           -- grep files
        require("telescope.builtin").live_grep({})
      end)
    end,
  },
}
