vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true

vim.opt.ffs = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.nu = true

vim.opt.list = true
vim.opt.listchars = {
  eol = "↲",
  tab = "➤ ",
  nbsp = "␣",
  trail = "◌",
  extends = "▶",
  precedes = "◀",
}
vim.opt.showbreak = "↪ "

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 750
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append({ c = true })
