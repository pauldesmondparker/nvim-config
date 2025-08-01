local Plugins = {
  { 'tpope/vim-fugitive' },
  { 'wellle/targets.vim' },
  { 'tpope/vim-repeat' },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  { 'numToStr/Comment.nvim',        config = true, event = 'VeryLazy' },

    --[[============================================================
                                 THEMES
    ==============================================================]]
    -- Activate chosen theme in `init.lua`
  { 'folke/tokyonight.nvim' },
  {  -- Requires some extra stuff to make transparent.
    -- 'adisen99/apprentice.nvim',
    name = 'adisen99/apprentice.nvim',
    dir = "~/sandpit/nvim/apprentice.nvim",
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      vim.g.apprentice_transparent_bg = true
      vim.g.apprentice_invert_selection = true
      vim.g.apprentice_italicize_comments = true

      require('apprentice').setup({
        plugins = {
          "buftabline",
          "coc",
          "cmp", -- nvim-cmp
          "fzf",
          "gitgutter",
          "gitsigns",
          "lsp",
          "lspsaga",
          "nerdtree",
          "netrw",
          "nvimtree",
          "neogit",
          "packer",
          "signify",
          "startify",
          "syntastic",
          "telescope",
          "treesitter"
        },
        langs = {
          "c", "clojure", "coffeescript", "csharp", "css", "elixir",
          "golang", "haskell", "html", "java", "js", "json",
          "jsx", "lua", "markdown", "moonscript",
          "objc", "ocaml", "purescript",
          "python", "ruby", "rust",
          "scala", "typescript",
          "viml",
          "xml"
        }
      })
    end
  },
  -- {
  --   'vague2k/vague.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  -- },
  -- {'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     undercurl = true,
  --     underline = true,
  --     bold = true,
  --     italic = {
  --     strings = true,
  --     comments = true,
  --     operators = false,
  --     folds = true,
  --     },
  --     strikethrough = true,
  --     invert_selection = false,
  --     invert_signs = false,
  --     invert_tabline = false,
  --     inverse = true, -- invert background for search, diffs, statuslines and errors
  --     contrast = "soft", -- can be "hard", "soft" or empty string
  --     palette_overrides = {},
  --     overrides = {},
  --     dim_inactive = false,
  --     transparent_mode = true,
  --   }
  -- },

  -- { 'folke/tokyonight.nvim' },
  -- { 'joshdick/onedark.vim' },
  -- { 'tanvirtin/monokai.nvim' },
  -- { 'lunarvim/darkplus.nvim' },
  --
  -- { 'romainl/Apprentice',           lazy = false,  priority = 1000 },
  -- { 'pauldesmondparker/Apprentice', branch='fix/neovim-unsupported-ctermul', lazy = false, priority = 1000 },
  -- { name = 'romainl/Apprentice', dir = '~/sandpit/neovim/Apprentice/', dev = true, lazy = false, priority = 1000 },
}

return Plugins
