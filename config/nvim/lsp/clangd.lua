return {
	cmd = {
		"clangd",
		"--background-index",
		"--offset-encoding=utf-16",
	},
	root_markers = { "compile_commands.json", "compile_flags.txt" },
	filetypes = { "c", "cpp", "objc", "obcpp" },
}
