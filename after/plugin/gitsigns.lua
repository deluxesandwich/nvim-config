local cmp_status_ok, gitsigns = pcall(require, "gitsigns")
if not cmp_status_ok then
	return
end

gitsigns.setup()
