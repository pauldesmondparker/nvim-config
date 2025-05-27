-- Space as leader key
vim.g.mapleader = ','

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^')
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>aa', ':keepjumps normal! ggVG<cr>')
vim.keymap.set({'i'}, 'jj', '<Esc>')

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- paste

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')

vim.keymap.set('n', '<leader>p', '<cmd>set paste<cr><cmd>lua print("paste")<cr>')
vim.keymap.set('n', '<leader>P', '<cmd>set nopaste<cr><cmd>lua print("nopaste")<cr>')

vim.keymap.set('n', '<leader>md', '<CMD>w !pandoc | bcat -b firefox<cr>', { silent = true, noremap = true })

vim.keymap.set('n', '<leader>D', function()
  local diagnostics = vim.diagnostic.get()
  print(vim.inspect(diagnostics))
end, { noremap = true, silent = true })

-- copy Path to Working file
vim.keymap.set("n", "<leader>pw", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("path:", path)
end)
