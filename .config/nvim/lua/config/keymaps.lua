vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- buffer navigation
map("n", "<S-l>", ":bn<CR>", opts)
map("n", "<S-h>", ":bp<CR>", opts)

-- text management
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- window resize
map("n", "<C-A-k>", ":horizontal resize +2<CR>", opts)
map("n", "<C-A-j>", ":horizontal resize -2<CR>", opts)
map("n", "<C-A-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-A-l>", ":vertical resize +2<CR>", opts)

-- buffer nav
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- oil
map("n", "<leader>e", ":Oil<CR>", opts)

-- cycle lsp diagnostics
map("n", "<C-n>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "<C-p>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)

-- navigating long warpped sentences / lines
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- typst export and previewing pdf
map("n", "<leader>tp", ":TypstPreview<CR>", opts)

-- typst preview pdf in zathura
map("n", "<leader>pf", ":!zathura %:r.pdf &<CR>", opts)

-- format buffer without saving
map("n", "<leader>bf", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- start/stop liveserver
map("n", "<leader>ss", "<cmd>LiveServerStart<cr>")
map("n", "<leader>st", "<cmd>LiveServerStop<cr>")

-- toggle lsp text
local text_on = true
map("n", "<leader>lt", function()
  text_on = not text_on
  vim.diagnostic.config({ virtual_text = text_on })
  if text_on then
    print("diagnostics on")
    -- vim.diagnostic.config({ signs = true })
  else
    print("diagnostics off")
    -- vim.diagnostic.config({ signs = false })
  end
end)
map("n", "<leader>e", function()
  require("oil").toggle_float()
end, opts)

-- clear current search
-- map({ "n", "v" }, "<Esc><Esc>", "<cmd>noh<cr>", opts)
