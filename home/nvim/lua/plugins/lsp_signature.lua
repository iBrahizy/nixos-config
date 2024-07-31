return {
   "ray-x/lsp_signature.nvim",
   event = "VeryLazy",
   opts = {},
   config = function ()
      local cfg = {
         hint_enable = false,
         floating_window_above_cur_line = false,
         floating_window_off_y = -2,
      }
      require "lsp_signature".setup(cfg)
   end
}
