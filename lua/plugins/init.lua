local Plugins = {
  { 'tpope/vim-fugitive' },
  { 'wellle/targets.vim' },
  { 'tpope/vim-repeat' },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  { 'numToStr/Comment.nvim',        config = true, event = 'VeryLazy' },

  -- Themes
  { 'folke/tokyonight.nvim' },
  { 'joshdick/onedark.vim' },
  { 'tanvirtin/monokai.nvim' },
  { 'lunarvim/darkplus.nvim' },
  { 'romainl/Apprentice',           lazy = false,  priority = 1000 },
}

return Plugins
