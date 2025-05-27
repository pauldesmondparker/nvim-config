local Plugin = {'olimorris/codecompanion.nvim'}

Plugin.opts = {}

Plugin.dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-treesitter/nvim-treesitter',
  'ravitemer/mcphub.nvim',
}

-- Configure in your setup
function Plugin.config()
  require('codecompanion').setup({
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true
        }
      }
    },
    -- strategies = {
    --   chat = {
    --     adapter = "anthropic",
    --   },
    --   inline = {
    --     adapter = "anthropic",
    --   },
    -- },
  })
end

return Plugin
