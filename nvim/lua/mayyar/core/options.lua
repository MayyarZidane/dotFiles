local opt = vim.opt 

--enable mouse
opt.mouse ="nvi"

--line numbers
opt.relativenumber = true
opt.number = true

--tabs and indention
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

--appearance
opt.termguicolors = true
opt.background = "dark"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

--set - a letter from word
opt.iskeyword:append("-")

