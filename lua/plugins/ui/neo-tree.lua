local plugin = { "nvim-neo-tree/neo-tree.nvim" }

plugin.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
}

plugin.config = function()
    require("neo-tree").setup({
        window = { width = 30 },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        event_handlers = {
            {
                event = "file_open_requested",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        },
    })

    vim.keymap.set("n", "<C-N>", "<Cmd>Neotree reveal left toggle=true<CR>", { silent = true, noremap = true })
end

return plugin
