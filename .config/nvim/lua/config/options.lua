vim.opt.number = true
vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.spelllang = "en"
vim.opt.cursorline = false
vim.opt.scrolloff = 10
vim.opt.laststatus = 3
vim.opt.fillchars:append({ eob = " " })

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "c", "java" },
    callback = function()
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
    end,
})

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "no"
vim.opt.colorcolumn = "125"
vim.opt.showmode = false

vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-")
vim.opt.clipboard:append("unnamedplus")
vim.opt.encoding = "UTF-8"

vim.opt.wildmenu = true
vim.opt.wildignorecase = true

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
