return {
    {
        "catppuccin/nvim",
        enabled = true,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = {    -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                float = {
                    transparent = false,       -- enable transparent floating windows
                    solid = false,             -- use solid styling for floating windows, see |winborder|
                },
                show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
                term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false,           -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15,         -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,             -- Force no italic
                no_bold = false,               -- Force no bold
                no_underline = false,          -- Force no underline
                styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" },   -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                color_overrides = {},
                custom_highlights = function(colors)
                    return {
                        -- Diagnostic virtual text
                        DiagnosticVirtualTextError = { fg = colors.overlay0, italic = true },
                        DiagnosticVirtualTextWarn = { fg = colors.overlay0, italic = true },
                        DiagnosticVirtualTextInfo = { fg = colors.overlay0, italic = true },
                        DiagnosticVirtualTextHint = { fg = colors.overlay0, italic = true },

                        -- Diagnostic underlines (keep original colors or mute these too)
                        DiagnosticUnderlineError = { sp = colors.overlay1, undercurl = true },
                        DiagnosticUnderlineWarn = { sp = colors.overlay1, undercurl = true },
                        DiagnosticUnderlineInfo = { sp = colors.overlay1, undercurl = true },
                        DiagnosticUnderlineHint = { sp = colors.overlay1, undercurl = true },
                    }
                end,
                default_integrations = true,
                auto_integrations = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            -- setup must be called before loading
            -- vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("monokai-pro").setup({
                transparent_background = true,
                terminal_colors = true,
                devicons = true, -- highlight the icons of `nvim-web-devicons`
                styles = {
                    comment = { italic = true },
                    keyword = { italic = true },       -- any other keyword
                    type = { italic = true },          -- (preferred) int, long, char, etc
                    storageclass = { italic = true },  -- static, register, volatile, etc
                    structure = { italic = true },     -- struct, union, enum, etc
                    parameter = { italic = true },     -- parameter pass in function
                    annotation = { italic = true },
                    tag_attribute = { italic = true }, -- attribute of tag in reactjs
                },
                filter = "pro",                        -- classic | octagon | pro | machine | ristretto | spectrum
                -- Enable this will disable filter option
                day_night = {
                    enable = false,            -- turn off by default
                    day_filter = "pro",        -- classic | octagon | pro | machine | ristretto | spectrum
                    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
                },
                inc_search = "background",     -- underline | background
                background_clear = {
                    "float_win",
                    "toggleterm",
                    "telescope",
                    -- "which-key",
                    "renamer",
                    "oil",
                    "notify",
                    -- "nvim-tree",
                    -- "neo-tree",
                    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
                }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                    indent_blankline = {
                        context_highlight = "default", -- default | pro
                        context_start_underline = false,
                    },
                },
            })
            vim.cmd.colorscheme "monokai-pro-classic"
        end

    }
}
