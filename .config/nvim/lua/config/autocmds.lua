vim.cmd("set number")
vim.cmd("set termguicolors")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.cmd("set cursorlineopt=number")
vim.cmd("set laststatus=3")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set ic hls is")
-- vim.cmd("autocmd TermOpen * startinsert")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.opt.fillchars = { eob = " " }
vim.opt.statusline = "%t%{&modified ? ' [+]' : ''}"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*", -- Apply to all file types
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})

-- save session on quit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("SessionSave")
  end,
})
