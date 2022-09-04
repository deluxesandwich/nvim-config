local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
	experimental = { native_menu = false, ghost_text = true },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, item)
			item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				nvim_lua = "[Lua]",
				treesitter = "[Tree]",
				path = "[Path]",
			})[entry.source.name]
			return item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
		["<CR>"] = cmp.mapping.confirm({ select = true }, { "i", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2, max_item_count = 5 },
		{ name = "treesitter", keyword_length = 2, max_item_count = 5 },
		{ name = "nvim_lua", max_item_count = 5 },
		{ name = "buffer", keyword_length = 5, max_item_count = 5 },
		{ name = "path", max_item_count = 5 },
	},
})

-- for search
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer", keyword_length = 2 },
	},
})

-- for command line
cmp.setup.cmdline(":", {
	sources = {
		{ name = "cmdline", keyword_length = 2 },
	},
})
