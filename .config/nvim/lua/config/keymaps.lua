local opts = { noremap = true, silent = true }

-- oil.nvim toggle
vim.api.nvim_create_user_command("OilToggle", function()
  vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
end, { nargs = 0 })
vim.keymap.set("n", "<Bslash>", "<cmd>OilToggle<cr>", opts)

-- text management
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", opts)     -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", opts)     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", opts) -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", opts) -- move line down(v)

-- better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- buffer navigation
vim.keymap.set("n", "<S-l>", "<cmd>bn<cr>", opts) -- move buffer next
vim.keymap.set("n", "<S-h>", "<cmd>bp<cr>", opts) -- move buffer prev

-- window resize
vim.keymap.set("n", "<A-S-k>", "<cmd>horizontal resize +5<cr>", opts) -- horizontal (taller)
vim.keymap.set("n", "<A-S-j>", "<cmd>horizontal resize -5<cr>", opts) -- horizontal (shorter)
vim.keymap.set("n", "<A-S-l>", "<cmd>vertical resize +10<cr>", opts)  -- vertical (wider)
vim.keymap.set("n", "<A-S-h>", "<cmd>vertical resize -10<cr>", opts)  -- vertical (thinner)

-- exit terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- start and stop lsp
vim.keymap.set("n", "<leader>ls", "<cmd>LspStop<cr>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>LspStart<cr>", opts)

-- clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", opts)

-- laucnh md.preivew
vim.keymap.set("n", "<leader>mm", "<cmd>MarkdownPreviewToggle<cr>", opts)

-- execute current file (toggleterm)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "go" },
  callback = function()
    local filetype = vim.bo.filetype
    local cmd = ""

    if filetype == "go" then
      cmd = "go run %"
    elseif filetype == "python" then
      cmd = "python %"
    end

    if cmd ~= "" then
      local term_toggle = function()
        local term_buf = vim.fn.bufnr("term://*")
        if term_buf ~= -1 then
          vim.cmd("bd! " .. term_buf)
        else
          vim.cmd("TermExec cmd='" .. cmd .. "'")
          vim.cmd("stopinsert")
        end
      end

      vim.keymap.set("n", "<C-'>", term_toggle, { noremap = true, silent = true })
    end
  end,
})

-- go to dashboard
vim.keymap.set("n", "<leader>gh", "<cmd>Alpha<cr>", opts)
