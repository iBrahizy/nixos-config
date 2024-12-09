vim.opt.colorcolumn = "101"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- jdtls
local config = {
   cmd = { 'jdtls' },
   root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

-- java debug for jdtls
local bundles = {
   vim.fn.glob(
   "/home/ibrahizy/.local/share/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
      1)
}

-- vscode-java-test for jdtls
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/ibrahizy/.local/share/vscode-java-test/server/*.jar", 1), "\n"))
config['init_options'] = {
   bundles = bundles,
}

require('jdtls').start_or_attach(config)

-- kind of like the play button in vscode/intellij
function Run()
   require('jdtls.dap').setup_dap_main_class_configs()
   require('dap').continue()
end

vim.keymap.set("n", "<Leader>r", ":lua Run()<CR>") -- explore with e
