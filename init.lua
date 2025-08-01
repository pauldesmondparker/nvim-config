if vim.g.vscode then
  -- VSCode extension
else
  -- ordinary Neovim
  local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
  end
  load('user.settings')
  load('user.commands')
  load('user.keymaps')
  require('user.plugins')

  local status = pcall(vim.cmd.colorscheme, { 'apprentice' })
  if status then
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true })
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "Visual", { nil,  nil, reverse = true })
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })color
    -- vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "NONE", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })
    -- still doesn't appear to work
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "green", bg = "#1f2335" })
    if (vim.fn.hlexists("IblScope") == 0) then
      vim.api.nvim_set_hl(0, "IblScope", { fg = "green", bg = "#1f2335" })
    end
  end
end
