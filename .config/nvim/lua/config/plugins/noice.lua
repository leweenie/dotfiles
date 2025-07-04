return {
  "folke/noice.nvim",
  enabled = true,
  opts = {},
  -- dependencies = {
  --   "MunifTanjim/nui.nvim",
  --   "rcarriga/nvim-notify",
  -- },
  config = function()
    require("noice").setup({
      lsp = {
        progress = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    })
  end,
}
