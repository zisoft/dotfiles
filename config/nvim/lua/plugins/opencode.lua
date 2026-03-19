vim.pack.add({
  { src = "https://github.com/nickjvandyke/opencode.nvim" },
  { src = "https://github.com/folke/snacks.nvim" }
})

-- Integration with folke/snacks.nvim
if _G.Snacks then
  Snacks.config.picker = Snacks.config.picker or {}
  Snacks.config.picker.actions = Snacks.config.picker.actions or {}
  Snacks.config.picker.actions.opencode_send = function(...)
    return require("opencode").snacks_picker_send(...)
  end

  -- Configure keybinding <Alt-a> in the picker input window to trigger the send action
  -- Snacks.config.picker.win = Snacks.config.picker.win or {}
  -- Snacks.config.picker.win.input = Snacks.config.picker.win.input or {}
  -- Snacks.config.picker.win.input.keys = Snacks.config.picker.win.input.keys or {}
  -- Snacks.config.picker.win.input.keys = {
  --   ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
  -- }
end

local opencode_cmd = "opencode --port"
local snacks_terminal_opts = {
  win = {
    position = "right",
    enter = false,
    on_win = function(win)
      -- Set up keymaps and cleanup for an arbitrary terminal
      require("opencode.terminal").setup(win.win)
    end,
  },
}

vim.g.opencode_opts = {
  server = {
    start = function()
      require('snacks.terminal').open(opencode_cmd, snacks_terminal_opts)
    end,
    stop = function()
      require('snacks.terminal').get(opencode_cmd, snacks_terminal_opts):close()
    end,
    toggle = function()
      require('snacks.terminal').toggle(opencode_cmd, snacks_terminal_opts)
    end,
  },
}

vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
  { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
  { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
  { desc = "Add line to opencode", expr = true })
