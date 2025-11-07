return {
    {
        "windwp/nvim-autopairs",
        enabled = true,
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        event = "InsertEnter",
        config = true,
    },
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        opts = {},
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                columns = { "icon" },
                buf_options = {
                    buflisted = false,
                    bufhidden = "hide",
                },
                float = {
                    border = 'single',
                    padding = 2,
                    max_width = 0.6,
                    max_height = 0.5
                },
                confirmation = {

                    border = 'single',
                },
                win_options = {
                    wrap = false,
                    signcolumn = "no",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                },
                view_options = {
                    show_hidden = false,
                },
                keymaps = {
                    ["l"] = { "actions.select", mode = "n" },
                    ["h"] = { "actions.parent", mode = "n" },
                    ["<C-h>"] = { "h", mode = "n" },
                    ["<C-l>"] = { "l", mode = "n" },

                    ["<C-v>"] = { "actions.select", opts = { vertical = true } },
                    ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
                    ["<C-p>"] = "actions.preview",

                    ["<leader>e"] = { "actions.close", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                },
            })
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        enabled = true,
        lazy = false,
    },
    {
        "akinsho/toggleterm.nvim",
        enabled = true,
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "float",
                size = 10,
                -- open_mapping = [[<c-\>]],
            })

            vim.keymap.set({ "i", "n", "t" }, "<A-\\>", function()
                local filetype = vim.bo.filetype
                local file_path = vim.fn.expand("%:t")
                local dir = vim.fn.expand("%:p:h")

                if filetype == "java" then
                    local class_name = file_path:match("(.+)%.java")
                    vim.cmd(string.format("TermExec cmd='cd %s && javac %s && java %s'", dir, file_path, class_name))
                elseif filetype == "python" then
                    vim.cmd(string.format("TermExec cmd='cd %s && python %s'", dir, file_path))
                elseif filetype == "cpp" then
                    vim.cmd(string.format("TermExec cmd='cd %s && g++ %s -o %s; ./%s'", dir, file_path,
                        vim.fn.expand("%:t:r"),
                        vim.fn.expand("%:t:r")))
                else
                    vim.cmd("ToggleTerm")
                end
            end, { noremap = true, silent = true })
        end,
    },
    {
        "tpope/vim-surround",
        config = function() end,
    },
    {
        "barrett-ruth/live-server.nvim",
        enabled = false,
        build = "pnpm add -g live-server",
        cmd = { "LiveServerStart", "LiveServerStop" },
        config = true,
    },
    {
        "sphamba/smear-cursor.nvim",
        enabled = false,
        opts = {
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            legacy_computing_symbols_support = true,
            smear_insert_mode = false,
            cursor_color = "none",

            -- SMOOTH
            -- stiffness = 0.5,
            -- trailing_stiffness = 0.49,

            -- FAST
            stiffness = 0.8,                      -- 0.6      [0, 1]
            trailing_stiffness = 0.5,             -- 0.4      [0, 1]
            stiffness_insert_mode = 0.6,          -- 0.4      [0, 1]
            trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
            distance_stop_animating = 0.5,        -- 0.1      > 0
        },
    },
    {
        "utilyre/barbecue.nvim",
        enabled = true,
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
        config = function()
            require("barbecue").setup({
                theme = {
                    normal = { bg = "NONE" },
                    ellipsis = { bg = "NONE" },
                    separator = { bg = "NONE" },
                    modified = { bg = "NONE" },
                    dirname = { bg = "NONE" },
                    basename = { bg = "NONE" },
                    context = { bg = "NONE" },
                },
            })

            local function clear_barbecue_highlights()
                for _, group in ipairs({
                    "BarbecueNormal",
                    "BarbecueEllipsis",
                    "BarbecueSeparator",
                    "BarbecueModified",
                    "BarbecueDirname",
                    "BarbecueBasename",
                    "BarbecueContext",
                }) do
                    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
                end
                vim.cmd([[
              highlight WinBar        guibg=NONE
              highlight WinBarNC      guibg=NONE
              highlight TabLineFill   guibg=NONE
            ]])
            end

            vim.api.nvim_create_augroup("TransparentBarbecue", { clear = true })
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = "TransparentBarbecue",
                callback = clear_barbecue_highlights,
            })

            clear_barbecue_highlights()
        end,
    },
    {
        "nvim-java/nvim-java",
        enabled = true,
    },
    {
        'folke/flash.nvim',
        event = "VeryLazy",
        keys = {
            { 's', mode = 'n', function() require('flash').jump() end }
        }
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
                css = {
                    mode = 'background',
                }
            })
        end,
    },
}
