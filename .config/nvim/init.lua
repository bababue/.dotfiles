--
--Settings


--Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Tabs
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

--Scrolling
vim.opt.scrolloff = 8
--vim.opt.wrap = false 

--Visual changes
vim.opt.cursorline = true
vim.opt.termguicolors = true

--Backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Fixed search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--Plugins
vim.g.mapleader = " "
vim.g.loaded_netrw = 1

--
--Keybinds

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
vim.keymap.set("n", "<leader>w", "<C-w><C-w>")

--Select everything
vim.keymap.set("", "<leader>a", "ggvG$")


--Packer Bootstrap
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

--
--Plugin Installation

require("packer").startup(function(use)
	--Package Manager and Dependencies
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
    use("MunifTanjim/nui.nvim")

	--Visual
	use("nvim-lualine/lualine.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("navarasu/onedark.nvim")
	use("goolord/alpha-nvim")

	--Quality of life
	use("numToStr/Comment.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("barrett-ruth/live-server.nvim")
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	--Additional menus
	use("nvim-tree/nvim-tree.lua")
	use("folke/trouble.nvim")
	use("nvim-telescope/telescope.nvim")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	--Treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)

--Colorscheme
vim.cmd([[colorscheme onedark]])

--Startup screen
require("alpha").setup(require("alpha.themes.startify").config)

--Comment.nvim
require("Comment").setup()

--Live-Server
require("live-server").setup()

--UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--Lualine
require("lualine").setup()

--Filetree
require("nvim-tree").setup()
vim.keymap.set("", "<leader>t", ":NvimTreeToggle<CR>")

--Trouble
vim.keymap.set("n", "<leader>r", function()
	require("trouble").toggle()
end)

--Telescope
vim.keymap.set("", "<leader>df", "<cmd>Telescope find_files<cr>")
vim.keymap.set("", "<leader>f", "<cmd>Telescope git_files<cr>")

--Treesitter / Autopairs
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "javascript", "typescript", "python", "lua", "vimdoc", "html", "css" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
require("nvim-autopairs").setup({})
