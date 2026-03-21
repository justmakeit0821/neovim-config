return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            {
                "zbirenbaum/copilot.lua",
                config = function()
                    require("copilot").setup({
                        copilot_model = "gpt-4o-2024-11-20",
                    })
                end,
            },
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",
        opts = {
            debug = false,
        },
        keys = {
            {
                "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
            },
            {
                -- show prompts actions with telescope
                "<leader>ccp",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end,
                desc = "CopilotChat - Prompt Actions",
            },
        },
    },
    {
        "github/copilot.vim"
    }
}
