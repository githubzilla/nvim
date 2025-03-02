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
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
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
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = require("plugins.treesitter"),
  },

  -- Formatting & Linting
  {
    "rhysd/vim-clang-format",
    config = require("plugins.clang-format"),
  },
  {
    "mfussenegger/nvim-lint",
    config = require("plugins.nvim-lint"),
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
      { 
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
      },
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
  { "github/copilot.vim" },
  {
    "yetone/avante.nvim",
    branch = "main",
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "HakonHarnes/img-clip.nvim",
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