local Plugin = {'stevearc/aerial.nvim'}

function Plugin.config()
  require('aerial').setup({
    filter_kind = false,
    -- filter_kind = {
    --   "Class",
    --   "Constructor",
    --   "Enum",
    --   "Field",
    --   "Function",
    --   "Interface",
    --   "Module",
    --   "Method",
    --   "Struct",
    -- },

    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { noremap = true })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { noremap = true })
    end,
  })
end

return Plugin
