local cmd = vim.cmd
local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- go to last loc when opening a buffer
api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- windows to close with "q"
api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- auto compile Packer after buffer change
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
