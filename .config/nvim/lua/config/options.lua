vim.opt.number = true
vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.spelllang = "en"
vim.opt.cursorline = false
vim.opt.scrolloff = 10
vim.opt.laststatus = 0
vim.opt.fillchars:append({ eob = " " })

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "c", "java", "cpp", "typst" },
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
vim.opt.colorcolumn = "150"
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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        vim.api.nvim_buf_create_user_command(0, 'Export', function(opts)
            local format = opts.args:lower()
            local commands = {
                pdf = 'LspTinymistExportPdf',
                png = 'LspTinymistExportPng',
                svg = 'LspTinymistExportSvg',
                markdown = 'LspTinymistExportMarkdown',
                md = 'LspTinymistExportMarkdown',
                text = 'LspTinymistExportText',
                query = 'LspTinymistExportQuery',
            }

            if commands[format] then
                vim.cmd(commands[format])
            else
                vim.notify("Unknown format: " .. format, vim.log.levels.ERROR)
            end
        end, {
            nargs = 1,
            complete = function()
                return { 'pdf', 'png', 'svg', 'markdown', 'text', 'query' }
            end,
            desc = "Export Typst document"
        })
    end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.typ",
    desc = "Insert Typst template for new files",
    callback = function(ev)
        if vim.api.nvim_buf_line_count(ev.buf) > 1 or vim.api.nvim_buf_get_lines(ev.buf, 0, 1, false)[1] ~= "" then
            return
        end

        local template = {
            '#import "preamble.typ": *',
            '#set text(font: "New Computer Modern", size: 11pt, lang: "en", fill: rgb("#F8F8F2"))',
            '#set page(',
            '    paper: "us-letter",',
            '    fill: rgb("#161616"),',
            '    margin: (top: 1in, bottom: 1in, left: 1in, right: 1in),',
            '    footer: context {',
            '        set align(center)',
            '        set text(size: 9pt)',
            '        str(here().page())',
            '    }',
            ')',
            '#header(',
            '    class: "Course 0000",',
            '    sem: "Fall 2025",',
            '    type: "Lecture Notes"',
            ')',
        }

        vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, template)

        vim.api.nvim_win_set_cursor(0, { #template, 0 })
    end,
})
