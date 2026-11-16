vim.pack.add({
  -- { src = "https://github.com/echasnovski/mini.ai" },
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/echasnovski/mini.align" },
  { src = "https://github.com/echasnovski/mini.statusline" },
})

-- require("mini.ai").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.align").setup()

-- statusline
local MiniStatusline = require("mini.statusline")

-- Shortens every directory in the path to its first letter (plus "." if
-- hidden), but keeps the filename fully intact.
-- Example: ./.config/nvim/lua/plugins/mini.lua -> ./.c/n/l/p/mini.lua
--
-- max_len: the length (in characters) above which shortening kicks in. If the
-- path is shorter, it is returned unchanged. Default: 40.
local function shorten_path(path, max_len)
  max_len = max_len or 40
  if #path <= max_len then
    return path
  end

  local parts = {}
  for segment in path:gmatch("[^/]+") do
    table.insert(parts, segment)
  end

  if #parts == 0 then
    return path
  end

  local result = {}
  for i, part in ipairs(parts) do
    if i == #parts then
      -- last part = filename, keep it unchanged
      table.insert(result, part)
    else
      -- directory: keep first letter, "." for hidden directories
      if part:sub(1, 1) == "." and #part > 1 then
        table.insert(result, "." .. part:sub(2, 2))
      elseif #part >= 1 then
        table.insert(result, part:sub(1, 1))
      end
    end
  end

  return table.concat(result, "/")
end

-- Estimates the display width (columns) of a string. mini.statusline section
-- functions return plain text (highlights are applied separately via hl
-- groups), so we can measure directly. strdisplaywidth also accounts for
-- multibyte/wide characters.
local function display_width(s)
  return vim.fn.strdisplaywidth(s)
end

local statusline = function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git           = MiniStatusline.section_git({ trunc_width = 40 })
  local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 40 })
  -- local location      = MiniStatusline.section_location({ trunc_width = 1000 })
  local location      = '%l│%2v (%P)'

  local tab_icon = "󰌒 "
  local width = vim.bo.tabstop
  if vim.bo.expandtab then
    tab_icon = "󱁐 "
    width = vim.bo.shiftwidth
  end
  local indent = tab_icon .. width

  -- Dynamically determine the width available for the filename:
  -- current window width minus all other sections. With vertical splits,
  -- winwidth shrinks and the path gets shorter automatically.
  -- 'location' contains unexpanded %-codes, so we reserve a fixed buffer.
  local LOCATION_RESERVE = 16 -- approx. width of e.g. "123│45 (67%)"
  local BUFFER           = 4  -- small safety margin
  local MIN_LEN          = 12 -- never shorter than this, otherwise unreadable

  local used = display_width(mode) + display_width(git) + display_width(diff)
             + display_width(indent) + display_width(fileinfo) + LOCATION_RESERVE
  local max_len = vim.api.nvim_win_get_width(0) - used - BUFFER
  if max_len < MIN_LEN then
    max_len = MIN_LEN
  end

  local filename = shorten_path(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':~'), max_len)

  return MiniStatusline.combine_groups({
    { hl = mode_hl,                 strings = { mode } },
    { hl = 'MiniStatuslineDevinfo', strings = { git, diff } },
    '%<', -- Mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineFileinfo', strings = { indent } },
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
    { hl = 'MiniStatuslineFileinfo', strings = { location } },
  })
end

MiniStatusline.setup({
  content = {
    active = statusline,
    inactive = nil,
  },
  use_icons = true
})

