return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
      -- Bubbles config for lualine
      -- Author: lokesh-krishna
      -- MIT license, see LICENSE for more details.

      -- stylua: ignore
      local colors = {
        blue   = 'none',
        cyan   = 'none',
        black  = '#908CAA',
        white  = '#908CAA',
        red    = 'none',
        violet = 'none',
        grey   = 'none',
      }

			local mode_lower = function()
				local mode = vim.fn.mode()
				local modes = {
					["n"] = "normal",
					["i"] = "insert",
					["v"] = "visual",
					["V"] = "visual line",
					[""] = "visual block",
					["c"] = "command",
					["r"] = "replace",
					["t"] = "terminal",
				}
				vim.g.lower_mode = (modes[mode] or mode):lower()
			end

			local bubbles_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.violet },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.white },
				},

				insert = { a = { fg = colors.black, bg = colors.blue } },
				visual = { a = { fg = colors.black, bg = colors.cyan } },
				replace = { a = { fg = colors.black, bg = colors.red } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.white },
				},
			}

			require("lualine").setup({
				options = {
					theme = bubbles_theme,
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							function()
								mode_lower()
								return vim.g.lower_mode
							end,
							separator = { left = "" },
							right_padding = 2,
						},
					},
					lualine_b = { "filename", "diagnostics" },

					lualine_c = {
						"%=", --[[ add your center components here in place of this comment ]]
					},
					lualine_x = {},
					lualine_y = { "diff", "branch", "filetype", "progress" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 100 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {},
				extensions = {},
			})
		end,
	},
}
