require("nvchad.configs.lspconfig").defaults()

-- HELP:
-- read :h vim.lsp.config for changing options of lsp servers 
-- read :h lspconfig-all for all the default lsp configurations

vim.lsp.config.intelephense = {
  filetypes = { "php", "blade" },

  -- pass through to the actual Intelephense process
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          "../shared" -- laravel monorepo structure dost, scan as well outside the project root dir, the shared dir
        },
      },
      files = {
        associations = { "*.php", "*.blade.php" },
      },
    },
  },
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("html", {
  capabilities = capabilities,

  filetypes = { "html", "blade" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  }
})

vim.lsp.config("emmet_language_server", {
  filetypes = { "html", "blade" },
})

vim.lsp.config("cssls", {
  capabilities = capabilities,
})

vim.lsp.config("ts_ls", {
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

local servers = { "intelephense", "html", "emmet_language_server", "cssls", "ts_ls", "tailwindcss" }
vim.lsp.enable(servers)

