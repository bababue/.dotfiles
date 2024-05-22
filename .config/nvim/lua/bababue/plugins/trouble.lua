return {
    "folke/trouble.nvim",
    config = function()
        vim.keymap.set("n", "<leader>r", function() 
            require("trouble").toggle()
        end)
    end
}
