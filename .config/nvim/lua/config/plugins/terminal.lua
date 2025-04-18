return {
  {
    "akinsho/toggleterm.nvim",
    enabled = true,
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        size = 10,
        -- open_mapping = [[<c-\>]],
      })

      vim.keymap.set({ "i", "n", "t" }, "<A-\\>", function()
        local file_type = vim.bo.filetype
        local file_path = vim.fn.expand("%:.")

        if file_type == "python" then
          vim.cmd("TermExec cmd='python " .. file_path .. "'")
        elseif file_type == "go" then
          vim.cmd("TermExec cmd='go run " .. file_path .. "'")
        elseif file_type == "cpp" then
          local filename = vim.fn.expand('%:t:r')
          local filepath = vim.fn.expand('%')
          vim.cmd("TermExec cmd='g++ -o " .. filename .. " " .. filepath .. " && ./" .. filename .. "'")
        else
          vim.cmd("ToggleTerm")
        end
      end)
    end,
  },
}
