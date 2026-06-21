vim.lsp.enable({
  "clangd",
  "cssls",
  "html",
  "javascript",
  "jsonls",
  "lua_ls",
  "ts_ls",
  "yamlls",
})

-- Swift LSP (sourcekit)
local sourcekit_config = {
  cmd = { "xcrun", "sourcekit-lsp" },
  filetypes = { "swift", "objc", "objcpp" },
  root_markers = { ".git", "compile_commands.json", "Package.swift" },
}

vim.lsp.config("sourcekit", sourcekit_config)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift", "objc", "objcpp" },
  callback = function(args)
    local root = vim.fs.root(args.buf, sourcekit_config.root_markers)
    local client_config = vim.tbl_deep_extend("force", sourcekit_config, {
      root_dir = root or vim.uv.cwd()
    })

    vim.lsp.start(client_config)
  end,
})

vim.lsp.enable("sourcekit")


-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = "Enable auto-completion",
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
--       vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup', 'noselect' }
--
--       -- trigger completion on every character (may be slow!)
--       -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       -- client.server_capabilities.completionProvider.triggerCharacters = chars
--
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--       -- vim.notify("Completion enabled!")
--
--       -- Ctrl-Space funktioniert nicht im Windows-Terminal
--       vim.keymap.set("i", "<C-space>", function() vim.lsp.completion.get() end, { desc = "Lsp: get completion" })
--     end
--   end,
-- })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp: Goto definition" })
vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "Lsp: Format buffer" })
