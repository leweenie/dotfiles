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
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set termguicolors")
vim.opt.fillchars = { eob = " " }
vim.opt.showmode = false

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "go", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

-- create a custom command with completion
vim.api.nvim_create_user_command("Export", function(opts)
  vim.cmd("LspTinymistExport" .. opts.args)
end, {
  nargs = 1,
  complete = function()
    return {
      "Pdf",
      "Png",
      "Svg",
      "Text",
      "AnsiHighlight",
      "Markdown",
      "Query",
    }
  end,
})
