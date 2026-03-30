return
{
  {
    'akinsho/bufferline.nvim',
    version = "*",
    opts = {
      options = {
        numbers = "ordinal"
      }
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
      vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
      vim.keymap.set("n", "<S-A-h>", "<cmd>BufferLineMovePrev<cr>")
      vim.keymap.set("n", "<S-A-l>", "<cmd>BufferLineMoveNext<cr>")
    end,
    dependencies = 'echasnovski/mini.icons',
  }
}

