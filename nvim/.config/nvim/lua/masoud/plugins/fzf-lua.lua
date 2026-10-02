return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" }, -- Uses your existing mini.icons[cite: 2, 7, 9]
  cmd = "FzfLua",
  keys = {
    -- Live grep search across project files
    { 
      "<leader>sg", 
      function() require("fzf-lua").live_grep() end, 
      desc = "FzfLua Live Grep" 
    },
    -- Grep exact string/word under cursor
    { 
      "<leader>sw", 
      function() require("fzf-lua").grep_cword() end, 
      desc = "FzfLua Grep Current Word" 
    },
    -- Grep visual selection (works in Visual mode)
    {
      "<leader>sw",
      function() require("fzf-lua").grep_visual() end,
      mode = "v",
      desc = "FzfLua Grep Selection"
    },
  },
  opts = {
    -- Optional: match theme style with your setup
    winopts = {
      height = 0.85,
      width = 0.80,
      row = 0.35,
    },
  },
}
