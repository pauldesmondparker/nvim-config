local Plugin = {'tzachar/local-highlight.nvim'}

-- Snacks probably deserves it's own plugin file.
-- It gives the front-end that HY and Rad use, but I don't like it.
-- Plugin.dependencies = {
--   {
--     'folke/snacks.nvim',
--     priority = 1000,
--     lazy = false,
--     opts = {
--       bigfile = { enabled = true },
--       dashboard = { enabled = true },
--       explorer = { enabled = true },
--       indent = { enabled = true },
--       input = { enabled = true },
--       picker = { enabled = true },
--       notifier = { enabled = true },
--       quickfile = { enabled = true },
--       scope = { enabled = true },
--       scroll = { enabled = true },
--       statuscolumn = { enabled = true },
--       words = { enabled = true },
--     }
--   },
-- }

function Plugin.config()
  require('local-highlight').setup({
    disable_file_types = {'tex'},
    hlgroup = 'Search',
    cw_hlgroup = nil,
    -- Whether to display highlights in INSERT mode or not
    insert_mode = false,
    min_match_len = 1,
    max_match_len = math.huge,
    highlight_single_match = false,
    animate = {
      enabled = false,
    },
  })
end

return Plugin
