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
                    "jdtls",
                    "clangd",
                    "basedpyright",
                    "tinymist",
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
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
        integrations = {
            lspconfig = true,
        },
    },

    -- Then your lua_ls config
    vim.lsp.config('lua_ls', {
        root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr,
                { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml',
                    'selene.yml', '.git' })
            if root then
                on_dir(root)
            else
                on_dir(vim.fn.getcwd())
            end
        end
    }),

    vim.lsp.enable({
        "lua_ls",
        "jdtls",
        "clangd",
        "basedpyright",
        "tinymist",
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
