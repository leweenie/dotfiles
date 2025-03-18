return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        size = 10,
        -- open_mapping = [[<c-\>]],
      })

      vim.keymap.set({ "i", "n", "t" }, "<C-Bslash>", function()
        local file_type = vim.bo.filetype
        local file_path = vim.fn.expand("%:.")

        if file_type == "python" then
          vim.cmd("TermExec cmd='python " .. file_path .. "'")
        elseif file_type == "go" then
          vim.cmd("TermExec cmd='go run " .. file_path .. "'")
        else
          vim.cmd("ToggleTerm")
        end
      end)
    end,
  },
}
