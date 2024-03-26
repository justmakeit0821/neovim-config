return {
   "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        -- set key bindings for Neotree
        vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal left toggle<CR>', {})
    end
}
