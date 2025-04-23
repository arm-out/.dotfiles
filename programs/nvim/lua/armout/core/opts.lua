vim.cmd("let g:netrw_liststyle = 3")

local set = vim.opt

-- line numbers
set.relativenumber = true
set.number = true

-- tabs and indetation
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false
set.autoindent = true

set.wrap = false

set.cursorline = true

-- search settings
set.ignorecase = true
set.smartcase = true

set.signcolumn = "yes"

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitright = true
set.splitbelow = true
