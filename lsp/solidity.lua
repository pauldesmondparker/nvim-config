return {
  cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
  filetypes = { 'solidity' },
  single_file_support = true,
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, { '.git' }) or vim.fn.getcwd())
  end,
}
