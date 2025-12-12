local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true -- It enables the termguicolors option, which tells Neovim to output colors using true color (24-bit RGB) codes to the terminal emulator.
opt.cursorline = true --entire line where the cursor is currently located to be highlighted
opt.laststatus = 3
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.mouse = "a"
opt.showmode = false -- Don't show the mode, since it's already in the status line
opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.undofile = true -- Save undo history
opt.undolevels = 10000
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.smartcase = true
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }

opt.signcolumn = "yes" -- Keep signcolumn on by default

opt.updatetime = 250 -- how quickly certain automated features (especially those provided by plugins) are triggered.
opt.timeoutlen = 1000 -- Neovim waits for a key sequence to complete

-- Configure how new splits should be opened
opt.splitright = true -- :vsp or vsplit
opt.splitbelow = true -- :sp or :split

opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
opt.sidescrolloff = 10 -- Columns of context
opt.confirm = true -- Confirm to save unsaved changes
opt.grepprg = "rg --vimgrep" --redefines the external program that Neovim uses when you execute the built-in search commands like :grep or :lgrep. Need to install ripgrep
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true })

-- TODO: Double check if needed:
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split" -- Preview substitutions live, as you type!
opt.breakindent = true -- Enable break indent
opt.formatoptions = "jcroqlnt" -- tcqj
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.tabstop = 2 -- Number of spaces tabs count for
opt.winminwidth = 5 -- Minimum window width

-- Needed?
opt.swapfile = false --disables the swapfile option, preventing Neovim from creating a temporary .swp (swap) file every time you open a buffer (file) for editing.
opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.expandtab = true -- Use spaces instead of tabs
opt.wrap = false -- Disable line wrap
