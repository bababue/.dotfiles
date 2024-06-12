return {
 "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set('n', '<leader>z', ":Git<Enter>", {})
    end
}
