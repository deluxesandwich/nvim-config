local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
	return
end

local status_ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lsp then
	return
end

local servers = {
	"bashls", -- bash
	"clangd", -- c, c++
	"dockerls", -- Dockerfile
	"html",
	"jsonls", -- JSON
	"yamlls", -- yaml
	"golangci_lint_ls",
	"gopls", -- go
	"pyright", -- python
	"black", -- python formatter
	"sumneko_lua", -- lua
	"stylua",
	"rust_analyzer", -- rust
}

mason.setup()
mason_lspconfig.setup({
	ensure_installed = servers,
})

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- remove hover window border
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = nil }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = nil }),
}

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
	end,
	handlers = handlers,
}

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

-------------------------------------------------------------------------------
-- Lua
-------------------------------------------------------------------------------
lspconfig.sumneko_lua.setup({
	single_file_support = true,
	on_attach = function(client, bufnr)
		lspconfig.util.default_config.on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

-------------------------------------------------------------------------------
-- Python
-------------------------------------------------------------------------------
vim.g.python3_host_prog = "/Users/ashao/.pyenv/shims/python"
lspconfig.pyright.setup({
	single_file_support = true,
	on_attach = function(client, bufnr)
		lspconfig.util.default_config.on_attach(client, bufnr)
	end,
})

-------------------------------------------------------------------------------
-- Go
-------------------------------------------------------------------------------
lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		lspconfig.util.default_config.on_attach(client, bufnr)
	end,
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			linksInHover = false,
			codelenses = {
				generate = true,
				gc_details = true,
				regenerate_cgo = true,
				tidy = true,
				upgrade_depdendency = true,
				vendor = true,
			},
			usePlaceholders = true,
		},
	},
})

-- LSP handlers configuration
local lsp_handler = {
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
	},
	diagnostic = {
		virtual_text = { spacing = 4, prefix = "", source = true },
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},
	},
}

-- Diagnostic signs
local diagnostic_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(diagnostic_signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- Diagnostic configuration
vim.diagnostic.config(lsp_handler.diagnostic)

-- Hover configuration
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp_handler.float)

-- Signature help configuration
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp_handler.float)
