require "nvchad.options"

local options = {
    backup = false,                             -- Disable backup files
    cmdheight = 1,                              -- Reduce space in command line for messages
    completeopt = { "menuone", "noselect" },    -- Autocompletion settings for cmp
    hlsearch = false,                           -- Disable highlighting search results
    mouse = "a",                                -- Enable mouse support in all modes
    pumheight = 10,                             -- Set popup menu height for suggestions
    showtabline = 0,                            -- Disable tabline display
    smartcase = true,                           -- Enable case-sensitive searching if uppercase used
    smartindent = true,                         -- Smart indentation behavior
    -- autoindent = true,
    splitbelow = true,                          -- Horizontal splits open below the current window
    splitright = true,                          -- Vertical splits open to the right
    swapfile = false,                           -- Disable swap files
    termguicolors = true,                       -- Enable true color support
    timeoutlen = 300,                           -- Timeout length for key mappings
    undofile = true,                            -- Enable undo file support for persistent undo
    updatetime = 300,                           -- Set update time for file changes
    writebackup = false,                        -- Disable write backup files
    expandtab = true,                           -- Convert tabs to spaces
    shiftwidth = 4,                             -- Set number of spaces for indentation
    tabstop = 4,                                -- Set number of spaces for a tab
    cursorline = true,                          -- Highlight the current line where the cursor is
    number = true,                              -- Display line numbers
    relativenumber = true,                      -- Display absolute line numbers
    numberwidth = 1,                            -- Set width for the number column
    wildmenu = true,                            -- Enable command-line completion menu
    clipboard = "unnamed,unnamedplus",          -- Enable system clipboard integration
    signcolumn = "yes",                         -- Always show the sign column
    wrap = false,                               -- Disable line wrapping
    linebreak = false,                          -- Disable breaking words on wrap
    scrolloff = 8,                              -- Keep 8 lines of context above/below cursor
    sidescrolloff = 8,                          -- Keep 8 columns of context on either side of cursor
    whichwrap = "bs<>[]hl",                     -- Define keys for moving across wrapped lines
}

-- Apply all options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Enable both cursorline and cursorcolumn highlighting (doesn't work when the bg is transparent)
vim.o.cursorlineopt = 'both'
