-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvbox",
    transparency = true,

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
   tabufline = {
     enabled = true,
     lazyload = false
   },

   telescope = { style = "bordered" }, -- borderless / bordered

   statusline = {
     theme = "default", -- default/vscode/vscode_colored/minimal
     -- default/round/block/arrow separators work only for default statusline theme
     -- round and block will work for minimal theme only
     separator_style = "default",
     -- order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
     order = { "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd" },
     modules = nil,
   },

   lsp = { signature = true },

   colorify = {
     enabled = true,
     mode = "virtual", -- fg, bg, virtual
     virt_text = "󱓻 ",
     highlight = { hex = true, lspvars = true },
   },

}

return M
