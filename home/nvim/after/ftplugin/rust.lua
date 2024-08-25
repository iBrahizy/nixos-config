local set = vim.opt

set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = false

vim.cmd.compiler("cargo")
vim.keymap.set("n", "<Leader>r", ":make run<CR>")
