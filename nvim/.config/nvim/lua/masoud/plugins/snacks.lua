return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = { enabled = true }, -- This replaces mini.pick/Telescope
  },
  keys = {
    -- Top-level Search (Your missing <leader>ff and <leader>sf)
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>sf", function() Snacks.picker.grep() end, desc = "Grep (Search Files)" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    -- Other useful Toggles
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
  },
}
