vim.cmd("set number")
vim.cmd("set termguicolors")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.cmd("set cursorlineopt=number")
vim.cmd("set laststatus=3")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set ic hls is")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set termguicolors")
-- vim.opt.fillchars = { eob = " " }
vim.opt.showmode = false

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.g.markdown_fenced_languages = {
    "ts=typescript",
}
