--  ______    _ _ _                ____        _   _
-- |  ____|  | (_) |              / __ \      | | (_)
-- | |__   __| |_| |_ ___  _ __  | |  | |_ __ | |_ _  ___  _ __  ___
-- |  __| / _` | | __/ _ \| '__| | |  | | '_ \| __| |/ _ \| '_ \/ __|
-- | |___| (_| | | || (_) | |    | |__| | |_) | |_| | (_) | | | \__ \
-- |______\__,_|_|\__\___/|_|     \____/| .__/ \__|_|\___/|_| |_|___/
--                                      | |
--                                      |_|

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Enables 24-bit RGB color in the TUI.
vim.opt.termguicolors = true

-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.expandtab = true

-- Do smart autoindenting when starting a new line.
vim.opt.smartindent = true

-- This option changes how text is displayed.  It doesn't change the text
-- in the buffer, see 'textwidth' for that.
vim.opt.wrap = false

-- Ignore case in search patterns, cmdline-completion, when
-- 	searching in the tags file, and expr-==.
vim.opt.ignorecase = true
-- Override the 'ignorecase' option if the search pattern contains upper
-- 	case characters.  Only used when the search pattern is typed and
-- 	'ignorecase' option is on.
vim.opt.smartcase = true

-- If in Insert, Replace or Visual mode put a message on the last line.
-- 	The hl-ModeMsg highlight group determines the highlighting.
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
vim.opt.clipboard = "unnamedplus"

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- If this many milliseconds nothing is typed the swap file will be
-- 	written to disk (see crash-recovery).
vim.opt.updatetime = 300

-- Maximum number of items to show in the popup menu
vim.opt.pumheight = 10

-- The value of this option determines the scroll behavior when opening,
-- 	closing or resizing horizontal splits.
vim.opt.spk = "cursor"

vim.opt.colorcolumn = "90"

vim.opt.splitbelow = true
vim.opt.splitright = true

--  ______ _ _         ____        _   _
-- |  ____(_) |       / __ \      | | (_)
-- | |__   _| | ___  | |  | |_ __ | |_ _  ___  _ __  ___
-- |  __| | | |/ _ \ | |  | | '_ \| __| |/ _ \| '_ \/ __|
-- | |    | | |  __/ | |__| | |_) | |_| | (_) | | | \__ \
-- |_|    |_|_|\___|  \____/| .__/ \__|_|\___/|_| |_|___/
--                          | |
--                          |_|

-- Swap files store changes you've made to the buffer. If Vim or your computer
-- crashes, they allow you to recover those changes.
vim.opt.swapfile = false
vim.opt.backup = false

-- When a file has been detected to have been changed outside of Vim and
-- it has not been changed inside of Vim, automatically read it again.
vim.opt.autoread = true

-- When on, Vim automatically saves undo history to an undo file when
-- writing a buffer to a file, and restores undo history from the same
-- file on buffer read.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Make line numbers default
vim.opt.nu = true
