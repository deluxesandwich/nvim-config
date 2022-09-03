local status_ok, project = pcall(require, "project")
if not status_ok then
	return
end

project.setup({
	patterns = {
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"package.json",
		"go.mod",
		"^code",
	},
})
