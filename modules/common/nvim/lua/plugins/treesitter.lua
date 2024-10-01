return {
   "nvim-treesitter/nvim-treesitter",
   build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
   end,

   config = function()
      require 'nvim-treesitter.configs'.setup {
         ensure_installed = { "lua", "javascript" },
         auto_install = true,
         highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            -- disable = { "eruby", "ruby" },
         },
         -- I don't know what this does tbh 
         keymaps = {
            init_selection = "gnn",
         },
      }
   end
}
