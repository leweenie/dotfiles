return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {
            transparent = true,
        },
        config = function()
            require("tokyonight").setup({
                -- on_highlights = function(hl, c)
                --   local prompt = "#2d3149"
                --   hl.TelescopeNormal = {
                --     bg = c.none,
                --     fg = c.fg_dark,
                --   }
                --   hl.TelescopeBorder = {
                --     bg = c.none,
                --     fg = c.bg_dark,
                --   }
                --   hl.TelescopePromptNormal = {
                --     bg = c.none,
                --   }
                --   hl.TelescopePromptBorder = {
                --     bg = c.none,
                --     fg = prompt,
                --   }
                --   hl.TelescopePromptTitle = {
                --     bg = c.none,
                --     fg = prompt,
                --   }
                --   hl.TelescopePreviewTitle = {
                --     bg = c.none,
                --     fg = c.bg_dark,
                --   }
                --   hl.TelescopeResultsTitle = {
                --     bg = c.none,
                --     fg = c.bg_dark,
                --   }
                -- end,
                style = "night",
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            -- vim.cmd("colorscheme tokyonight-storm")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    transparency = true,
                    bold = false,
                    italic = false,
                },
            })
            vim.cmd("colorscheme rose-pine-main")
        end,
    },
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_float_style = "dim"
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#EA6962", bold = true })
            -- vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        "marko-cerovac/material.nvim",
        config = function()
            require("material").setup({
                contrast = {
                    terminal = false,
                    sidebars = false,
                    floating_windows = false,
                    cursor_line = false,
                    lsp_virtual_text = false,
                    non_current_windows = true,
                    filetypes = {},
                },
                styles = {
                    comments = { --[[ italic = true ]]
                    },
                    strings = { --[[ bold = true ]]
                    },
                    keywords = { --[[ underline = true ]]
                    },
                    functions = { --[[ bold = true, undercurl = true ]]
                    },
                    variables = {},
                    operators = {},
                    types = {},
                },
                plugins = {
                    "dashboard",
                    "flash",
                    "gitsigns",
                    "harpoon",
                    "indent-blankline",
                    "mini",
                    "nvim-web-devicons",
                    "telescope",
                },
                disable = {
                    colored_cursor = false,
                    borders = false,
                    background = true,
                    term_colors = false,
                    eob_lines = false,
                },
                high_visibility = {
                    lighter = false,
                    darker = true,
                },
                lualine_style = "default",
                async_loading = true,
                custom_colors = nil,
                custom_highlights = {},
            })
            -- vim.cmd("colorscheme material-deep-ocean")
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        config = function()
            vim.o.background = "dark"

            local c = require("vscode.colors").get_colors()
            require("vscode").setup({
                transparent = true,
                italic_comments = true,
                underline_links = true,
                disable_nvimtree_bg = true,
                terminal_colors = true,
                color_overrides = {
                    vscLineNumber = "#3B3F51",
                },
                group_overrides = {
                    Cursor = {
                        fg = c.vscDarkBlue,
                        bold = true,
                    },
                },
            })
            -- vim.cmd.colorscheme("vscode")
        end,
    },
    -- {
    --     "ramojus/mellifluous.nvim",
    --     config = function()
    --         require("mellifluous").setup({})
    --         vim.cmd("colorscheme mellifluous")
    --         vim.cmd("Mellifluous toggle_transparency")
    --         vim.api.nvim_set_hl(0, "Comment", { fg = "#5B5B5B", italic = true })
    --     end,
    -- },
}
