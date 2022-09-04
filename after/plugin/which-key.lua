local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local conf = {
	window = {
		padding = { 1, 1, 1, 1 },
	},
}

local opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	w = { "<cmd>update!<CR>", "Save" },
	q = { "<cmd>qa!<CR>", "Quit" },
    ["/"] = {"<cmd>ToggleTerm<CR>", "Toggle terminal"},

    c = {
        name = "Code",
		f = { "<cmd>FormatWriteLock<cr>", "Format" },
    },

    l = {
        name = "LSP",
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		R = { "<cmd>Telescope lsp_incoming_calls<cr>", "Read usage" },
		w = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Write usage" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
		D = { "<cmd>Telescope lsp_diagnostics<cr>", "Diagnostics" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definitions" },
		i = { "<cmd>Telescope lsp_implementation<cr>", "Implementation" },
    },

	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find files" },
		r = { "<cmd>Telescope live_grep<cr>", "Ripgrep" },
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer" },
		z = { "<cmd>Telescope builtin<cr>", "Builtin pickers" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},

	b = {
		name = "Buffer",
		c = { "<Cmd>bd!<Cr>", "Close current buffer" },
		D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
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
		s = { "<cmd>Neogit<CR>", "Status" },
	},
}

which_key.setup(conf)
which_key.register(mappings, opts)
