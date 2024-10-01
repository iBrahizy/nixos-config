return {
   'akinsho/toggleterm.nvim',
   config = function()
      require("toggleterm").setup {
         open_mapping = "<C-J>",
         insert_mappings = false,
         direction = "float",
      }
   end
}

