vim.api.nvim_command('set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.vim/ftplugin')
vim.api.nvim_command('let &packpath = &runtimepath')


vim.opt.ffs = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.showmode = true
vim.wo.wrap = false
vim.opt.hlsearch = true
vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

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

vim.opt.termguicolors = true
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 100
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append({ c = true })
-- Always show the signcolumn
vim.opt.signcolumn = "yes"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="*",
  callback = function()
    -- NonText ->  "eol", "extends", "precedes", "nbsp", "tab" and "trail"."
    vim.api.nvim_set_hl(0, "NonText", { ctermfg=28, fg="#008700" })
  end
})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="apprentice",
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", { cterm=bold, bold=true })
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Normal", { ctermbg="NONE", bg="NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg="NONE", bg="NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })
    -- still doesn't appear to work
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white", bg = "#1f2335" })
  end
})

require("lazy").setup({
  "folke/which-key.nvim",
--  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  { "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        indent = {
            chars = { "│", "¦", "┆", "┊", }, -- more code can be found in https://unicodeplus.com/

            style = {
                "#150040",
            },
        },
        blank = {
            enable = false,
            style = {
                "#6B0099",
            },
        }
      })
    end
  },
  -- 'Shougo/vimproc.vim', { 'do': 'make' } "async execution
  { "https://github.com/romainl/Apprentice.git",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme apprentice]])
    end,
  },
  { "neoclide/coc.nvim",
    branch = "master",
    build = "pnpm i",
  },
  "rust-lang/rust.vim",
  { "itchyny/lightline.vim",
    config = function()
      vim.g.lightline = {
        -- powerlineish, rosepine, nord, ayu_light, seoul256, Tomorrow, materia, ayu_dark, Tomorrow_Night_Bright, PaperColor_light,
        -- default, powerline, 16color, Tomorrow_Night, selenized_white, molokai, Tomorrow_Night_Blue, selenized_light, Tomorrow_Night_Eighties,
        -- PaperColor, selenized_black, wombat, one, PaperColor_dark, apprentice, deus, ayu_mirage, darcula, landscape, OldHope, jellybeans,
        -- material, solarized, srcery_drk, selenized_dark, simpleblack, dragoon
        colorscheme = "dragoon",
        active = {
          left = {
            { "mode", "paste" },
            { "readonly", "filename", "modified" },
            { "gitbranch", "gitstatus", "cocstatus" },
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "filetype" },
          },
        },
        component_function = {
          gitbranch = 'VimGitBranch',
          gitstatus = 'GitStatus',
          cocstatus = 'coc#status',
        },
        component_expand = {
          filetype = "lightline#filetype",
        },
      }
    end,
  },
  "machakann/vim-highlightedyank",
  "SirVer/ultisnips",
  "honza/vim-snippets",
  "tpope/vim-sensible",
  "tpope/vim-fugitive",
  "othree/html5.vim",
  "nicwest/vim-http",
  "chrisbra/Colorizer",
  {
      'glacambre/firenvim',
      -- Lazy load firenvim
      -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
      cond = not not vim.g.started_by_firenvim,
      build = function()
          require("lazy").load({ plugins = "firenvim", wait = true })
          vim.fn["firenvim#install"](0)
      end
  },
  "prisma/vim-prisma",
  "github/copilot.vim",
  "preservim/nerdtree",
  "preservim/tagbar",
  "ludovicchabant/vim-gutentags",
  {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "haskell",
          "html",
          "java",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "rust",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      }
    end
  },
  "nvim-tree/nvim-web-devicons",
  "lambdalisue/suda.vim",
  "jeffkreeftmeijer/vim-numbertoggle",
  "airblade/vim-gitgutter",
  "itchyny/vim-gitbranch",
})

--[[ function to add  to branch display --]]
function _G.gitBranch()
  return " " .. vim.fn["gitbranch#name"]()
end

--[[ Current kludge for gitBranch() --]]
vim.api.nvim_exec(
[[
function! g:VimGitBranch()
  return " " .. gitbranch#name()
endfunction
]],
true)

vim.api.nvim_command('source ~/.config/nvim/vimrc')
