return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "configs.ts-autotag"
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require "configs.neoscroll"
    end,
  },

  {
    'echasnovski/mini.surround',
    version = '*',
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "s", "<Nop>") -- disable built-in s
      require("mini.surround").setup({
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
        },
      })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "leath-dub/snipe.nvim",
    keys = {
      {"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
    },
    opts = {}
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- {
  --   "goolord/alpha-nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require "configs.alpha"
  --   end,
  -- }
}
