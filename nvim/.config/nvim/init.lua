vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
require("masoud.config.options")
require("masoud.config.keymaps")
require("masoud.config.autocmds")

-- [[ Configure and install plugins ]]
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
require('lazy').setup({
  spec = {import = "masoud.plugins"},
  {
    install = {
        colorscheme = {"dracula"},
    },
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          -- "tutor",
          "zipPlugin",
        },
      },
    }
  }
})
