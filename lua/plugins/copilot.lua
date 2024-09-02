local Plugin = {'zbirenbaum/copilot.lua'}
-- https://tamerlan.dev/setting-up-copilot-in-neovim-with-sane-settings/

Plugin.cmd = 'Copilot'
Plugin.event = 'InsertEnter'

Plugin.dependencies = {
  {
    'zbirenbaum/copilot-cmp',
    config = function()
        require("copilot_cmp").setup()
    end,
  },
}

function Plugin.config()
  require("copilot").setup({
    panel = {
      enabled = false,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<C-SPACE>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = false,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = false,
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
    on_status_update = require("lualine").refresh,
  })
end
  -- function Plugin.config()
  --   vim.keymap.set('i', '<C-SPACE>', 'copilot#Accept("<CR>")', { silent = true, noremap = true, expr = true })
  --   vim.g.copilot_no_tab_map = true
  -- end

  return Plugin
