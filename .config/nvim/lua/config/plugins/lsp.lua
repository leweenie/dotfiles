return {
  -- LSP RELATED
  {
    "neovim/nvim-lspconfig",
    dependencies = {
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
              "ts_ls",
              "lua_ls",
              "pyright",
              "tailwindcss",
              "cssls",
              "superhtml",
              "gopls",
              "sqlls",
            },
          })
        end,
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- DIAGNOSITC APPEARANCE RELATED

      -- ICONS
      local signs = { Error = "", Warn = "", Info = "", Hint = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- REMOVE UNDERLINE
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = false,
        update_in_insert = false,
        float = {
          border = "rounded",
        },
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lsp_config = require("lspconfig")

      lsp_config.lua_ls.setup({ capabilities = capabilities })
      lsp_config.ts_ls.setup({ capabilities = capabilities })
      lsp_config.pyright.setup({ capabilities = capabilities })
      lsp_config.tailwindcss.setup({ capabilities = capabilities })
      lsp_config.cssls.setup({ capabilities = capabilities })
      lsp_config.superhtml.setup({ capabilities = capabilities })
      lsp_config.gopls.setup({ capabilities = capabilities })
      lsp_config.sqlls.setup({ capabilities = capabilities })

      -- FORMATTING RELATED
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
    end,
  },

  -- AUTOCOMPLETION RELATED
  {
    "saghen/blink.cmp",
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
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
          -- null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.biome,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.sql_formatter,
        },
      })
    end,
  },
}
