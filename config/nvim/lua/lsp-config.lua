vim.lsp.enable({
  "clangd",
  "cssls",
  "html",
  "javascript",
  "jsonls",
  "lua_ls",
  "marksman",
  "tsgo",
  "yamlls",
})

-- Swift LSP (sourcekit)
local sourcekit_config = {
  cmd = { "xcrun", "sourcekit-lsp" },
  filetypes = { "swift", "objc", "objcpp" },
  root_markers = { ".git", "compile_commands.json", "Package.swift" },
  init_options = {
    indexUnitReaderPath = false,
  },
  settings = {
    swift = {
      formatting = {
        indentWidth = 2,
        tabWidth = 2,
        useSpaces = true,
      },
    },
  },
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

local function safe_goto_definition()
  vim.lsp.buf.definition({
    on_list = function(options)
      local unique_items = {}
      local seen = {}

      for _, item in ipairs(options.items) do
        local key = string.format("%s:%d:%d", item.filename, item.lnum, item.col)

        if not seen[key] then
          seen[key] = true
          table.insert(unique_items, item)
        end
      end

      if #unique_items == 1 then
        -- Native, fehlerfreie Methode für Neovim 0.12:
        local target = unique_items[1]

        -- 1. Datei in den aktuellen Buffer laden (oder wechseln, falls schon offen)
        local bufnr = vim.fn.bufadd(target.filename)
        vim.fn.bufload(bufnr)
        vim.api.nvim_set_current_buf(bufnr)

        -- 2. Cursor auf Zeile und Spalte setzen (Achtung: lnum ist 1-basiert, col ist 1-basiert in lsp.items, nvim_win_set_cursor erwartet 0-basierte Spalten)
        local row = target.lnum
        local col = math.max(0, target.col - 1)
        vim.api.nvim_win_set_cursor(0, { row, col })

        -- Optional: Fügt den Sprung zur Jump-List hinzu, damit <C-o> zurückspringt
        vim.cmd("normal! m'")
      else
        vim.fn.setqflist({}, " ", { title = options.title, items = unique_items })
        vim.cmd("copen")
      end
    end
  })
end


-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp: Goto definition" })
vim.keymap.set('n', 'gd', safe_goto_definition, { desc = "Lsp: Goto definition" })
vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "Lsp: Format buffer" })
