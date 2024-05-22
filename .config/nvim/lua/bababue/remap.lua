--Space as leader key
vim.g.mapleader = " "

--Custom keybinds
vim.keymap.set("", "ü", "{")
vim.keymap.set("", "ä", "}")
vim.keymap.set("", "Ö", "O<Esc>")
vim.keymap.set("", "ö", "o<Esc>")
vim.keymap.set("", "ß", "$")

--Y behaves like C or D
vim.keymap.set("n", "Y", "y$")

--Deletion without buffer
vim.keymap.set("", "<leader>d", "\"_d")
vim.keymap.set("", "<leader>D", "\"_D")

--System clipboard shortcut
vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>p", '"+p')
vim.keymap.set("", "<leader>P", '"+P')

--Center half-page jumps
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

--Switch between windows
vim.keymap.set("n", "<leader>h", "<C-w><C-h>")
vim.keymap.set("n", "<leader>j", "<C-w><C-j>")
vim.keymap.set("n", "<leader>k", "<C-w><C-k>")
vim.keymap.set("n", "<leader>l", "<C-w><C-l>")

vim.keymap.set("n", "<leader>w", "<C-w><C-w>")

--Select everything
vim.keymap.set("", "<leader>a", "ggvG$")
