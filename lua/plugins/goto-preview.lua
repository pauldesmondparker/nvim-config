local Plugin = { 'rmagatti/goto-preview' }

Plugin.event = {'BufEnter'}

function Plugin.config()
  local goto_preview = require('goto-preview')

  vim.keymap.set("n", "ghd", goto_preview.goto_preview_definition, { noremap = true })
  vim.keymap.set("n", "ght", goto_preview.goto_preview_type_definition, { noremap = true })
  vim.keymap.set("n", "ghi", goto_preview.goto_preview_implementation, { noremap = true })
  vim.keymap.set("n", "ghD", goto_preview.goto_preview_declaration, { noremap = true })
  vim.keymap.set("n", "gH", goto_preview.close_all_win, { noremap = true })
  vim.keymap.set("n", "ghr", goto_preview.goto_preview_references, { noremap = true })

  goto_preview.setup({})
end

return Plugin
