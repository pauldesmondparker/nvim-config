-- ~/.config/nvim/lua/plugins/header.lua
local Plugin = { 'sunwukonga/heading.nvim' }
-- local Plugin = {
--   name = 'sunwukonga/heading.nvim',
--   dir = '~/sandpit/neovim/heading.nvim/',
--   dev = true,
-- }

Plugin.keys = {
  -- lazy.nvim will call vim.keymap.set() for you
  { "<leader>ah", ":AddHeading<CR>", mode = "v", desc = "Splat a heading comment from selection above", silent = true, buffer = true },
}

-- lazy.nvim calls heading.nvim/plugin/heading.lua:setup with `opts` as argument.
Plugin.opts = {
  default_style = "shell"
}

return Plugin
