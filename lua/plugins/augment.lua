local Plugin = {'augmentcode/augment.vim'}

-- README
-- You'll first need to sign in with `:Augment signin`
-- Signout with `:Augment signout`
-- USING:
-- You can highlight code before initiating your question to limit context.
-- Don't forget to add a `.augmentignorre` to ignore unnecessary files.

function Plugin.config()
  vim.g.augment_workspace_folders = {'/home/dragoon/code/dcconnect/tspn', '/home/dragoon/code/dcconnect/DCC-chatbot'}
  -- vim.g.augment_disable_tab_mapping = true
  vim.keymap.set('i', '<C-SPACE>', '<CMD>call augment#Accept()<cr>', { silent = true, noremap = true })
  vim.keymap.set('i', '<CR>', 'pumvisible() ? "<CMD>call augment#Accept()<CR>" : "<CR>"', { silent = true, noremap = true, expr = true })
  vim.keymap.set({'n','x'}, '<leader>as', '<cmd>Augment status<cr>', { silent = true, noremap = true })
  vim.keymap.set({'n','x'}, '<leader>al', '<CMD>Augment log<cr>', { silent = true, noremap = true })
  vim.keymap.set({'n','x'}, '<leader>at', '<CMD>Augment chat-toggle<cr>', { silent = true, noremap = true })
  vim.keymap.set({'n','x'}, '<leader>ac', '<CMD>Augment chat<cr>', { silent = true, noremap = true })
  vim.keymap.set({'n','x'}, '<leader>an', '<CMD>Augment chat-new<cr>', { silent = true, noremap = true })
end

return Plugin
