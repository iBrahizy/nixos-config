return {
    "catppuccin/nvim",
    name = "catppuccin",

    dependencies = {
        require("plugins.treesitter"),
    },

    config = function()
        -- We don't need the `pcall` wrapper here because this function only runs after lazy ensured
        -- that the plugin is already loaded.
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            treesitter = true,
        })
    end,
}
