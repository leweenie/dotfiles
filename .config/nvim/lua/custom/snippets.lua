vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.html",
  callback = function()
    vim.fn.setreg("d", 'I<div>A</div>^f>i class=""i')
  end,
})
