return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      vim.cmd("set laststatus=3")
      local colors = {
        blue   = 'none',
        cyan   = 'none',
        black  = 'none',
        white  = 'none',
        red    = 'none',
        violet = 'none',
        grey   = 'none',
      }

      local personal = {
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
      local mode_lower = function()
        local mode = vim.fn.mode()
        local modes = {
          ['n'] = 'normal',
          ['i'] = 'insert',
          ['v'] = 'visual',
          ['V'] = 'visual line',
          [''] = 'visual block',
          ['c'] = 'command',
          ['r'] = 'replace',
          ['t'] = 'terminal'
        }
        vim.g.lower_mode = (modes[mode] or mode):lower()
      end

      require('lualine').setup {
        options = {
          theme = personal,
          component_separators = '',
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
        },
        ignore_focus = {},
        always_divide_middle = false,
        always_show_tabline = false,
        globalstatus = false,
        sections = {
          lualine_a = { function()
            mode_lower()
            return vim.g.lower_mode
          end },
          lualine_b = {},
          lualine_c = {
            '%=',
            { 'filetype', icon_only = true },
            { 'filename', symbols = { modified = '[+]', }
            },
          },
          lualine_x = {},
          lualine_y = {
            { 'fileformat',
              symbols = {
                unix = '',
                dos = '',
                mac = '',
              },
            },
            'hostname'
          },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  }
}
