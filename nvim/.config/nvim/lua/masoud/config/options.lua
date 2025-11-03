local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false -- Don't show the mode, since it's already in the status line
opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.undofile = true -- Save undo history
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.smartcase = true

opt.signcolumn = "yes" -- Keep signcolumn on by default

opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 1000 -- Neovim waits for a key sequence to complete

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

opt.cursorline = true
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
opt.sidescrolloff = 10 -- Columns of context
opt.confirm = true -- Confirm to save unsaved changes

-- TODO: Double check if needed:
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split" -- Preview substitutions live, as you type!
opt.breakindent = true -- Enable break indent
