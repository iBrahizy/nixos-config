require("gaming")

local set = vim.opt

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false
set.pumheight = 20
set.scrolloff = 5
set.cursorline = true
set.autoindent = true
set.title = true

set.number = true
set.signcolumn = "no"

set.wildoptions = { "fuzzy", "pum" }

vim.cmd.colorscheme("catppuccin")
