return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "jdtls",
                    "clangd",
                    "basedpyright",
                    "tinymist",
                    "jsonls",
                },
            })
        end,
    },
    {
        "saghen/blink.cmp",
        enabled = true,
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "super-tab" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",

            },
            completion = {
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
        opts_extend = { "sources.default" },
    },

    vim.lsp.enable({
        "lua_ls",
        "jdtls",
        "bashls",
        "gopls",
        "clangd",
        "basedpyright",
        "tinymist",
        "jsonls",
    }),


    vim.diagnostic.config({
        virtual_text = true,
        underline = false,
        update_in_insert = false,
        float = {
            border = "single",
        },
    }),

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then
                return
            end

            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end,
                })
            end
        end,
    })
}
