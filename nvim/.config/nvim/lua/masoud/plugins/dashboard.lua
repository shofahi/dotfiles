return {
  'goolord/alpha-nvim',
  dependencies = { 
    'nvim-tree/nvim-web-devicons',
    'rubiin/fortune.nvim', -- Adding this for the random quotes
  },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    -- 1. Shofahi ASCII Header
    dashboard.section.header.val = {
      [[                                                        ]],
      [[   ██████╗██╗  ██╗ ██████╗ ███████╗ █████╗ ██╗  ██╗██╗  ]],
      [[  ██╔════╝██║  ██║██╔═══██╗██╔════╝██╔══██╗██║  ██║██║  ]],
      [[  ╚█████╗ ███████║██║   ██║█████╗  ███████║███████║██║  ]],
      [[   ╚═══██╗██╔══██║██║   ██║██╔══╝  ██╔══██║██╔══██║██║  ]],
      [[  ██████╔╝██║  ██║╚██████╔╝██║     ██║  ██║██║  ██║██║  ]],
      [[  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ]],
      [[                                                        ]],
    }

    -- 2. Menu Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    }

    -- 3. Dynamic Fortune Footer
    local fortune = require("fortune").get_fortune()
    dashboard.section.footer.val = fortune
    dashboard.section.footer.opts.hl = "Type"

    -- 4. UI Toggle Autocmd (Hides statusline/tabline on dashboard)
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.opt.laststatus = 0
        vim.opt.showtabline = 0
        vim.api.nvim_create_autocmd("BufUnload", {
          pattern = "<buffer>",
          callback = function()
            vim.opt.laststatus = 3 -- Restores global statusline from your options.lua
            vim.opt.showtabline = 2
          end,
        })
      end,
    })

    require("alpha").setup(dashboard.opts)
  end,
}
