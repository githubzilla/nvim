return require("lazy").setup({
  -- UI & Theme
  {
    "kaicataldo/material.vim",
    branch = "main",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_theme_style = "darker"
      vim.cmd.colorscheme("material")
    end,
  },
  {
    "mhinz/vim-startify",
    config = require("plugins.startify"),
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins.lualine"),
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins.bufferline"),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = require("plugins.indentline"),
  },

  -- File Management
  {
    "907th/vim-auto-save",
    config = require("plugins.autosave"),
  },
  { "rbgrouleff/bclose.vim" },
  {
    "kelly-lin/ranger.nvim",
    config = require("plugins.ranger"),
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins.nvim-tree"),
  },
  {
    "stevearc/oil.nvim",
    config = require("plugins.oil"),
  },

  -- Editor Features
  { "jiangmiao/auto-pairs" },
  { "godlygeek/tabular" },
  {
    "phaazon/hop.nvim",
    config = require("plugins.hop"),
  },
  {
    "mbbill/undotree",
    config = require("plugins.undotree"),
  },

  -- LSP & Completion
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navic",
      {
        "hrsh7th/nvim-cmp",
        config = require("plugins.nvim-cmp"),
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
    config = require("plugins.lspconfig"),

  },
  {
    "ray-x/lsp_signature.nvim",
    config = require("plugins.lsp_signature"),
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { 
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = require("plugins.treesitter"),
  },

  -- Formatting & Linting
  {
    "stevearc/conform.nvim",
    config = require("plugins.conform"),
  },
  {
    "mfussenegger/nvim-lint",
    config = require("plugins.nvim-lint"),
  },
  {
      'numToStr/Comment.nvim',
      opts = {
          -- add any options here
      }
  },

  -- Debug
  {
    "puremourning/vimspector",
    config = require("plugins.vimspector"),
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    config = require("plugins.which-key"),
  },

  -- Task Running
  {
    "skywind3000/asynctasks.vim",
    dependencies = { "skywind3000/asyncrun.vim" },
    config = require("plugins.asynctasks"),
  },

  -- Git Integration
  { "tpope/vim-fugitive" },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("plugins.lazygit"),
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require("plugins.gitsigns"),
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = require("plugins.telescope"),
  },

  -- Session Management
  {
    "rmagatti/auto-session",
    config = require("plugins.auto-session"),
  },

  -- Note Taking
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/lua-utils.nvim",
      "pysan3/pathlib.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = require("plugins.neorg"),
  },

  -- Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    config = require("plugins.markdown"),
  },

  -- AI Assistance
  { "github/copilot.vim",
    config = require("plugins.copilot"),
  },
  {
    "yetone/avante.nvim",
    branch = "main",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      {
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
	config = require("plugins.fzf-lua"),
      },
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
    config = require("plugins.avante"),
  },
}, {
  install = {
    colorscheme = { "material" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}) 
