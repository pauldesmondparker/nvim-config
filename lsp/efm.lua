local solhint = require('efmls-configs.linters.solhint')
local eslint = require('efmls-configs.linters.eslint')
local prettier_d = require('efmls-configs.formatters.prettier_d')
local gofumpt = require('efmls-configs.formatters.gofumpt')
local go_revive = require('efmls-configs.linters.go_revive')
local python_ruff = require('efmls-configs.formatters.ruff')
local python_ruff_sort = require('efmls-configs.formatters.ruff_sort')
local python_ruff_lint = require('efmls-configs.linters.ruff')

return {
  filetypes = { 'solidity', 'typescriptreact', 'typescript', 'go', 'python' },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  },
  settings = {
    languages = {
      solidity = { solhint, prettier_d },
      javascript = { prettier_d },
      javascriptreact = { prettier_d },
      typescript = { eslint, prettier_d },
      typescriptreact = { eslint, prettier_d },
      go = { gofumpt, go_revive },
      python = { python_ruff, python_ruff_sort, python_ruff_lint },
    },
  },
}
