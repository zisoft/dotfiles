if vim.fn.getcwd() == "/Users/mario/src/darktable" then
  vim.cmd("set makeprg='../ninja.sh'")
end
