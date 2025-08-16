require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', 's', '<Nop>') -- remove the mapping in s so i can use mini.sorround

-- integration for tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- keep selection active when indenting in visual mode
map("v", ">", ">gv", { desc = "Indent and reselect" })
map("v", "<", "<gv", { desc = "Outdent and reselect" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle {
        pos = "float",
        id = "floatTerm",
        float_opts = {
            relative = "editor",
            row = 0,
            col = 0.9,
            width = 0.5,
            height = 0.85,
            border = "single",
        }
    }
end, { desc = "toggle floating terminal" })
