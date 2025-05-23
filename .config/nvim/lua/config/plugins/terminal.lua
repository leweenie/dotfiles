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
        local file_name = vim.fn.expand("%:t:r")
        local full_file_name = vim.fn.expand("%:t")

        -- python
        if file_type == "python" then
          vim.cmd("TermExec cmd='python " .. file_path .. "'")

          -- go
        elseif file_type == "go" then
          vim.cmd("TermExec cmd='go run " .. file_path .. "'")

          -- c++
        elseif file_type == "cpp" then
          vim.cmd("TermExec cmd='g++ -o " .. file_name .. " " .. file_path .. " && ./" .. file_name .. "'")

          -- c
        elseif file_type == "c" then
          vim.cmd("TermExec cmd='gcc " .. file_path .. " -o " .. file_name .. " && ./" .. file_name .. "'")

          -- javascript
        elseif file_type == "javascript" then
          vim.cmd("TermExec cmd='node " .. file_name .. "'")
        else
          vim.cmd("ToggleTerm")
        end
      end)
    end,
  },
}
