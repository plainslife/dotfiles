local neoscroll = require('neoscroll')


local keymap = {
  ["<C-b>"] = function () neoscroll.ctrl_b({ duration = 300 }) end,
  ["<C-f>"] = function () neoscroll.ctrl_f({ duration = 300 }) end,

  -- ["<C-y>"] = function () neoscroll.scroll(-0.1, { move_cursor = true, duration = 50 }) end,
  -- ["<C-e>"] = function () neoscroll.scroll(0.1, { move_cursor = true, duration = 50 }) end,

  ["<C-k>"] = function () neoscroll.scroll(-0.1, { duration = 50 }) end,
  ["<C-j>"] = function () neoscroll.scroll(0.1, { duration = 50 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end


neoscroll.setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = {
    '<C-u>',
    '<C-d>',
    -- '<C-b>',
    -- '<C-f>'
  },


  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = false,            -- don't stop at <EOF> when scrolling downwards
  respect_scrolloff = true,   -- don't stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = false,
  easing = "linear",           --default
  ignored_events = {           -- Events ignored while scrolling
      'WinScrolled', 'CursorMoved'
  },
})
