-- return {
--   'echasnovski/mini.statusline',
--   version = '*',
--   config = function()
--     require('mini.statusline').setup({
--       content = {
--         active = function()
--           local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
--           local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
--           local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
--           local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
--           local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
--           local location      = MiniStatusline.section_location({ trunc_width = 75 })
--           local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
--
--           return MiniStatusline.combine_groups({
--             { hl = mode_hl,                 strings = { mode } },
--             { hl = 'MiniStatuslineDevinfo', strings = { diff, diagnostics, lsp } },
--             '%<', -- Mark general truncate point
--             { hl = 'MiniStatuslineFilename', strings = { filename } },
--             '%=', -- End left alignment
--             { hl = mode_hl,                  strings = { search, location } },
--           })
--         end
--       }
--     })
--   end
-- }

return{
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    version = false,
    dependencies = 'echasnovski/mini.icons',
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      return {
        options = {
          theme = 'auto',
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
          ignore_focus = {
            "dapui_watches", "dapui_breakpoints",
            "dapui_scopes", "dapui_console",
            "dapui_stacks", "dap-repl"
          }
        },
        sections = {
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, shorting_target = 75, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          }
        }
      }
    end
}
