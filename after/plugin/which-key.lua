local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

local conf = {
    window = {
        padding = {1,1,1,1},
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
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>qa!<CR>", "Quit" },
    ["f"] = { "<cmd>Format<CR>", "Format" },

    b = {
        name = "Buffer",
        c = { "<Cmd>bd!<Cr>", "Close current buffer" },
        D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    t = {
        name = "nvim-tree",
        t = { "<Cmd>NvimTreeToggle<Cr>", "Toggle" },
        f = { "<Cmd>NvimTreeFindFileToggle<Cr>", "Move cursor to file in tree" },
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
