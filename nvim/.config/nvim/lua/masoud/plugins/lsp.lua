--LSP (Language Server Protocol) client, which provides IDE-like features such as go-to-definition, autocompletion, and real-time error checking
-- Type :Mason then install the wanted lsp

local on_attach = function(client, bufnr)
  -- Disable hover for ruff to let basedpyright handle it
  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
  end
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--header-insertion=never",
            "--header-insertion-decorators=false",
            "--fallback-style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 120}",
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                ignore = { '*' },
              },
            },
          },
        },
        bashls = {},
        ruff = {},
        lemminx = {},
        tailwindcss = {},
        svelte = {},
        html = {},
        yamlls = {},
        hls = {},
        copilot = {},
      },
    },
    config = function(_, opts)
      -- 1. Setup Diagnostic Icons (Using the 0.11 text property)
      -- If you have a specific icons module, you can replace these strings
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.HINT] = signs.Hint,
            [vim.diagnostic.severity.INFO] = signs.Info,
          },
        },
      })

      -- 2. Configure and Enable Servers
      for server, config in pairs(opts.servers or {}) do
        -- Inject blink.cmp capabilities so completion works
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach

        -- Use the new 0.11 native LSP API
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      -- 3. Clangd specific keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Clangd specific keymaps",
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client ~= nil and client.name == "clangd" then
            vim.keymap.set(
              "n",
              "<leader><Tab>",
              "<cmd>ClangdSwitchSourceHeader<CR>",
              { buffer = bufnr, desc = "Switch between source and header" }
            )
          end
        end,
      })
    end,
  },

  {
    'p00f/clangd_extensions.nvim',
    ft = { "c", "cpp" },
    opts = {},
  },

  {
    'williamboman/mason.nvim',
    cmd = "Mason",
    opts = {},
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
