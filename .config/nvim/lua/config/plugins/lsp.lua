return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- LSP
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- lua
      require 'lspconfig'.lua_ls.setup { capabilities = capabilities }

      -- python
      require 'lspconfig'.pyright.setup { capabilities = capabilities }

      -- js, etc.
      require 'lspconfig'.biome.setup { capabilities = capabilities }

      -- javascript/typescript
      require 'lspconfig'.ts_ls.setup {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      }

      -- bash
      require 'lspconfig'.bashls.setup {}

      local c = vim.lsp.protocol.make_client_capabilities()
      c.textDocument.completion.completionItem.snippetSupport = true

      -- css
      require 'lspconfig'.cssls.setup { capabilities = c }

      -- html
      require 'lspconfig'.superhtml.setup { capabilities = c }


      -- FORMATTING
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  }
}
