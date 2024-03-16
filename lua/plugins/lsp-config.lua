return {
    {
        -- for installing language servers
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        -- for bridging mason with nvim-lspconfig, making it easier to use both plugins together
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "tsserver" }
            })
        end
    },
    {
        -- for hooking up neovim to language servers
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- set up for each installed language server manually
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({}) -- prerequisite: npm install -g typescript (assume installed node.js + npm)

            -- set up lsp keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
