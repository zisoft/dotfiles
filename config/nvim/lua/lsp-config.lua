vim.lsp.enable({
  "clangd",
  "cssls",
  "html",
  "lua_ls",
  "yamlls",
})

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

