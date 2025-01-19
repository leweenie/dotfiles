local opts = { noremap = true, silent = true }

-- source file
vim.keymap.set("n", "<leader>v", "<cmd>source %<cr>", opts)

-- save file
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>", opts)

-- oil.nvim toggle
vim.api.nvim_create_user_command("OilToggle", function()
  vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
end, { nargs = 0 })
vim.keymap.set("n", "<Bslash>", "<cmd>OilToggle<cr>", opts)

-- text management
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- buffer navigation
vim.keymap.set("n", "<S-l>", "<cmd>bn<cr>", opts) -- move buffer next
vim.keymap.set("n", "<S-h>", "<cmd>bp<cr>", opts) -- move buffer prev

-- window resize
vim.keymap.set("n", "<A-S-k>", "<cmd>horizontal resize +5<cr>", opts) -- horizontal (taller)
vim.keymap.set("n", "<A-S-j>", "<cmd>horizontal resize -5<cr>", opts) -- horizontal (shorter)
vim.keymap.set("n", "<A-S-l>", "<cmd>vertical resize +10<cr>", opts)  -- vertical (wider)
vim.keymap.set("n", "<A-S-h>", "<cmd>vertical resize -10<cr>", opts)  -- vertical (thinner)

-- exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- start and stop lsp
vim.keymap.set("n", "<leader>ls", "<cmd>LspStop<cr>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>LspStart<cr>", opts)

-- clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", opts)

-- liveserver
vim.keymap.set("n", "<leader>ss", "<cmd>LiveServerStart<cr>", opts)
vim.keymap.set("n", "<leader>st", "<cmd>LiveServerStop<cr>", opts)
