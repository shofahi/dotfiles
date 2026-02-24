return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>u", group = "UI/Toggles" },
      { "<leader>w", group = "Windows" },
      { "<leader>f", group = "Format/Files" },
      { "<leader>c", group = "Code/Next-Prev" },
    },
  },
}
