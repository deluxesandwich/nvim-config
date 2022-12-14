local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.setup({
	window = {
		padding = { 1, 1, 1, 1 },
	},
})

which_key.register({
	q = { "<cmd>qa!<CR>", "Quit" },

	["/"] = { "<cmd>ToggleTerm<CR>", "Toggle terminal" },

	-- Harpoon
	m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon mark file" },
	M = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon quick menu" },
	["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon nav to file 1" },
	["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon nav to file 2" },
	["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon nav to file 3" },
	["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon nav to file 4" },
	n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon nav next" },
	p = { "<cmd>lua require('harpoon.ui').nav_previous()<cr>", "Harpoon nav previous" },

	c = {
		name = "Code",
		f = { "<cmd>FormatWriteLock<cr>", "Format" },
		a = { vim.lsp.buf.code_action, "Code action" },
	},

	l = {
		name = "LSP",
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		R = { "<cmd>Telescope lsp_incoming_calls<cr>", "Read usage" },
		w = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Write usage" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
		D = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definitions" },
		i = { "<cmd>Telescope lsp_implementation<cr>", "Implementation" },
	},

	["<leader>"] = {
		name = "Search - Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find files" },
		o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer" },
		z = { "<cmd>Telescope builtin<cr>", "Builtin pickers" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},

	f = {
		name = "File / Buffer",
		d = { "<Cmd>bd!<Cr>", "Close current buffer" },
		s = { "<Cmd>w<Cr>", "Save current buffer" },
		p = { "<Cmd>bprevious<Cr>", "Previous buffer" },
		n = { "<Cmd>bnext<Cr>", "Next buffer" },
	},

	T = {
		name = "Tab",
		d = { "<Cmd>tabclose<Cr>" },
		p = { "<Cmd>tabprevious<Cr>" },
		n = { "<Cmd>tabnext<Cr>" },
	},

	t = {
		name = "nvim-tree",
		t = { "<Cmd>NvimTreeToggle<Cr>", "Toggle" },
		f = { "<Cmd>NvimTreeFindFile<Cr>", "Move cursor to file in tree" },
		c = { "<Cmd>NvimTreeCollapse<Cr>", "Collapse" },
		r = { "<Cmd>NvimTreeRefresh<Cr>", "Refresh" },
	},

	z = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		s = { "<cmd>Neogit<CR>", "Neogit" },
		d = { "<cmd>Gitsigns diffthis<CR>", "Current buffer diff" },
	},
}, { prefix = "<leader>" })

which_key.register({
	K = { vim.lsp.buf.hover, "LSP documentation" },
})
