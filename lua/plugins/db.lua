return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup({
            -- sources = {
            --     require("dbee.sources").MemorySource:new({
            --         {
            --             id = "DB_ENV@USER_NAME",
            --             name = "DB_ENV@USER_NAME",
            --             type = "oracle",
            --             url = "oracle://<USER_NAME>:<PASSWORD>@<HOST>:<PORT>/<SERVICE_NAME>",
            --         },
            --     }),
            -- },
        })

        vim.api.nvim_set_keymap("n", "<leader>db", "<Cmd>Dbee toggle<CR>", { noremap = true, silent = true })
    end,
}
