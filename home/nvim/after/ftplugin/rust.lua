local set = vim.opt

set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = false

vim.cmd.compiler("cargo")
vim.keymap.set("n", "<Leader>r", ":make run<CR>")

vim.lsp.start({
    name = "rust-analyzer",
    cmd = { "rust-analyzer" },
    root_dir = vim.fs.root(0, { "Cargo.toml" })
})
