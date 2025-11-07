return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        dependencies = { "nvim-mini/mini.icons" },
        opts = {},
        config = function()
            require('fzf-lua').setup({
                winopts = {
                    fullscreen = false,
                    border = 'single',
                    preview = {
                        title = "k",
                        border = 'single',
                    }
                },
                keymap = {
                    builtin = {
                        ["<C-S-j>"] = "preview-down",
                        ["<C-S-k>"] = "preview-up",
                    },
                },
            })

            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').files({ cwd = '$HOME' }) end, opts)
            vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').oldfiles({}) end, opts)
            vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').live_grep({}) end, opts)
            vim.keymap.set('n', '<leader>fc', function() require('fzf-lua').files({ cwd = '$HOME/.config/nvim' }) end,
                opts)
        end
    }
}
