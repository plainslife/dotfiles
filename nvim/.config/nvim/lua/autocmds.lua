require "nvchad.autocmds"

-- use c++ syntax and highlighting for arduino sketch files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.ino",
    command = "set filetype=cpp"
})

-- Auto-set *.blade.php files to the "blade" filetype
local tbl = vim.api.nvim_create_augroup -- short alias
local blade_grp = tbl("BladeFiletypeRelated", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.blade.php",
  group = blade_grp,
  callback = function()
    vim.bo.filetype = "blade"
  end,
})

-- use 2 space indentation for the indicated file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "blade", "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})
