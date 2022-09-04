-- Install packer if not installed
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

-- Packer installations
require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself

	-- theme
	use("EdenEast/nightfox.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

    -- lsp load status
    use("j-hui/fidget.nvim")

	-- file explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- keybinding hint
	use("folke/which-key.nvim")

	-- autopair
	use("windwp/nvim-autopairs")

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
		},
	})

	-- Snippet Engine and Snippet Expansion
	use({ "L3MON4D3/LuaSnip", requires = { "saadparwaiz1/cmp_luasnip" } })
	use("rafamadriz/friendly-snippets")

	-- lsp
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- formatting
	use("mhartington/formatter.nvim")

	-- syntax highlight
	use({
		"nvim-treesitter/nvim-treesitter", -- Highlight, edit, and navigate code
		requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
	})

	use("nvim-treesitter/nvim-treesitter-context") -- freeze top row for long code blocks

	-- comment with gc
	use("numToStr/Comment.nvim")

	-- add word boundries for CamelCase, snake_case, etc.
	use("chaoren/vim-wordmotion")

	-- easymotion like buffer quick search
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})

	use("ahmedkhalf/project.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	use("lewis6991/gitsigns.nvim")


	if is_bootstrap then
		require("packer").sync()
	end
end)
