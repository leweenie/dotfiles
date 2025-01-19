return {
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
    require("telescope").setup({
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

    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)

    -- vim.keymap.set("n", "<leader>ff", function() -- all files
    -- 	require("telescope.builtin").find_files({
    -- 		find_command = { "rg", "--ignore", "--hidden", "--files" },
    -- 	})
    -- end)

    vim.keymap.set("n", "<leader>fc", function() -- config files
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
  end,
}
