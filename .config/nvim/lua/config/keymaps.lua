local opts = { noremap = true, silent = true }

-- oil.nvim toggle
vim.keymap.set("n", "<leader>\\", function()
  require("oil").toggle_float()
end, { desc = "Toggle Oil float" })

vim.keymap.set("n", "<leader>e", function()
  if vim.bo.filetype == "oil" then
    require("oil.actions").close.callback()
  else
    vim.cmd("Oil")
  end
end)

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
vim.keymap.set("n", "<C-A-k>", "<cmd>horizontal resize +5<cr>", opts) -- horizontal (taller)
vim.keymap.set("n", "<C-A-j>", "<cmd>horizontal resize -5<cr>", opts) -- horizontal (shorter)
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize +10<cr>", opts)  -- vertical (wider)
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize -10<cr>", opts)  -- vertical (thinner)

-- exit terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- start and stop lsp
-- vim.keymap.set("n", "<leader>ls", "<cmd>LspStop<cr>", opts)
-- vim.keymap.set("n", "<leader>lf", "<cmd>LspStart<cr>", opts)

local diagnostic_status = false
vim.keymap.set("n", "<leader>ls", function()
  diagnostic_status = not diagnostic_status
  if diagnostic_status then
    vim.diagnostic.enable(false)
    print("diagnostics disabled")
  else
    vim.diagnostic.enable(true)
    print("diagnostics enabled")
  end
end, opts)

-- clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", opts)

-- launch md.preivew
vim.keymap.set("n", "<leader>mm", "<cmd>MarkdownPreviewToggle<cr>", opts)

-- go to dashboard
vim.keymap.set("n", "<leader>gh", "<cmd>Alpha<cr>", opts)

-- close buffer
vim.keymap.set("n", "<leader>cl", "<cmd>bd!<cr>", opts)

-- cycle lsp diagnostics
vim.keymap.set("n", "<C-n>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "<C-p>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)

-- gitsigns keymaps
local gitsigns = require("gitsigns")

vim.keymap.set("n", "<leader>n", function() -- goto next hunk
  if vim.wo.diff then
    vim.cmd.normal({ "<leader>n", bang = true })
  else
    gitsigns.nav_hunk("next")
  end
end)

vim.keymap.set("n", "<leader>p", function() -- goto previous hunk
  if vim.wo.diff then
    vim.cmd.normal({ "<leader>p", bang = true })
  else
    gitsigns.nav_hunk("prev")
  end
end)

vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk) -- open preivew

-- start liveserver
vim.keymap.set("n", "<leader>ss", "<cmd>LiveServerStart<cr>")
vim.keymap.set("n", "<leader>st", "<cmd>LiveServerStop<cr>")

-- unbind arrow keys
vim.keymap.set({ "i", "n", "v" }, "<Up>", "<Nop>", opts)
vim.keymap.set({ "i", "n", "v" }, "<Down>", "<Nop>", opts)
vim.keymap.set({ "i", "n", "v" }, "<Left>", "<Nop>", opts)
vim.keymap.set({ "i", "n", "v" }, "<Right>", "<Nop>", opts)

-- hex convert -> rgba
local map = vim.api.nvim_set_keymap
map("n", "<leader>cc", ':lua require("hex2rgba").hex2rgba()<cr>', { noremap = true })

-- list buffers
vim.keymap.set("n", "<leader>b", "<cmd>buffers<cr>", opts)

-- typst preview
vim.keymap.set("n", "<leader>tp", function()
  vim.cmd("TypstPreview")
end)

-- toggle lsp text
local text_on = true
vim.keymap.set("n", "<leader>lt", function()
  text_on = not text_on
  vim.diagnostic.config({ virtual_text = text_on })
  if text_on then
    print("virtual text on")
  else
    print("virtual text off")
  end
end)

-- toggle git signs
vim.keymap.set("n", "<leader>gs", function()
  require("gitsigns").toggle_signs()
end)
