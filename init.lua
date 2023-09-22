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

-- Example using a list of specs with the default options
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct


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

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- NonText ->  "eol", "extends", "precedes", "nbsp", "tab" and "trail"."
    vim.api.nvim_set_hl(0, "NonText", { ctermfg = 28, fg = "#008700" })
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bold = true, bg = "#3f4355" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bold = true, bg = "#3f4355" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bold = true, bg = "#3f4355" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bold = true, bg = "#3f4355" })
    vim.api.nvim_set_hl(0, "HighlightedyankRegion", { bold = true, bg = "#3f6355" })
  end
})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "apprentice",
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true })
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "NONE", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })
    -- still doesn't appear to work
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "green", bg = "#1f2335" })
  end
})

require("lazy").setup({
  "folke/which-key.nvim",
  --  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        indent = {
          chars = { "│", "¦", "┆", "┊", },
          -- chars = { "│", "¦", "┆", "┊" }, -- more code can be found in https://unicodeplus.com/
          style = {
            "#150040",
          },
        },
        --  											blank = { enable = false },
        blank = {
          chars = { "⁙", "⁘", "⁖", "⁚", "⸱" },
          style = {
            "#6B0099",
          },
        },
      })
    end
  },
  -- 'Shougo/vimproc.vim', { 'do': 'make' } "async execution
  {
    "https://github.com/romainl/Apprentice.git",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme apprentice]])
    end,
  },
  "rust-lang/rust.vim",
  {
    "itchyny/lightline.vim",
    config = function()
      --[[ add  to branch display --]]
      function _G.gitBranch()
        return " " .. vim.fn["gitbranch#name"]()
      end

      --[[ add +1 ~2 -3 to status display --]]
      function _G.gitStatus()
        local hunk_summary = vim.fn['GitGutterGetHunkSummary']()
        local a = hunk_summary[1]
        local m = hunk_summary[2]
        local r = hunk_summary[3]
        return string.format('+%d ~%d -%d', a, m, r)
      end

      vim.g.lightline = {
        -- powerlineish, rosepine, nord, ayu_light, seoul256, Tomorrow, materia, ayu_dark, Tomorrow_Night_Bright, PaperColor_light,
        -- default, powerline, 16color, Tomorrow_Night, selenized_white, molokai, Tomorrow_Night_Blue, selenized_light, Tomorrow_Night_Eighties,
        -- PaperColor, selenized_black, wombat, one, PaperColor_dark, apprentice, deus, ayu_mirage, darcula, landscape, OldHope, jellybeans,
        -- material, solarized, srcery_drk, selenized_dark, simpleblack, dragoon
        colorscheme = "powerline_transparent",
        active = {
          left = {
            { "mode",      "paste" },
            { "readonly",  "filename", "modified" },
            { "gitbranch", "gitstatus" },
            -- { "gitbranch", "gitstatus", "cocstatus" },
            -- TODO: add https://github.com/linrongbin16/lsp-progress.nvim
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "filetype" },
          },
        },
        component_function = {
          gitbranch = 'v:lua.gitBranch',
          gitstatus = 'v:lua.gitStatus',
          -- cocstatus = 'coc#status',
        },
        component_expand = {
          filetype = "lightline#filetype",
        },
      }
    end,
  },
  "machakann/vim-highlightedyank",
  --  "SirVer/ultisnips",
  --  "honza/vim-snippets",
  "tpope/vim-sensible",
  "tpope/vim-fugitive",
  "othree/html5.vim",
  "nicwest/vim-http",
  "chrisbra/Colorizer",
  {
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      -- require("lazy").load({ plugins = "firenvim", wait = true })
      vim.fn["firenvim#install"](0)
    end
  },
  "prisma/vim-prisma",
  {
    "github/copilot.vim", -- disabling of <TAB> done before here.
    config = function()
      vim.api.nvim_set_keymap("i", "<C-SPACE>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
  },
  "preservim/nerdtree",
  "preservim/tagbar",
  "ludovicchabant/vim-gutentags",
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            -- telescope-undo.nvim config, see below
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              preview_height = 0.8,
            },
            mappings = {
              i = {
                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-cr>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
      })
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
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
          "proto",
          "query",
          "regex",
          "rust",
          "solidity",
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
  "nvim-treesitter/nvim-treesitter-context",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect
      -- until you install the dependencies for them
      -- see the dependencies section below
      -- for more information
      --

      local lsp = require('lsp-zero').preset("recommended");
      local lspsettings = require('lsp-zero.settings')
      local lspconfig = require('lspconfig')
      local lspsaga = require('lspsaga')
      local mason = require('mason')
      local masonlspconfig = require('mason-lspconfig')
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      local servers = {
        'clangd',
--        'efm',
        'lua_ls',
        'prismals',
        'rust_analyzer',
        'solidity',
        'tsserver',
      }
      for _, lsp_string in ipairs(servers) do
        local specific_setup = {
          capabilities = capabilities,
          settings = {}
        };
        if lsp_string == 'solidity' then
          specific_setup.settings = {
            -- Forge remappings.
            solidity = {
              includePath = '',
              remapping = {
                ['ds-test/'] = 'lib/forge-std/lib/ds-test/src/',
                ['forge-std/'] = 'lib/forge-std/src/',
                ['./'] = 'src/',
                ['@chainlink/contracts/'] = 'lib/chainlink-brownie-contracts/contracts/',
              }
            }
          }
        end
 --       if lsp_string == 'efm' then
 --         specific_setup.filetypes = { "solidity" }
 --         specific_setup.init_options = { documentFormatting = true }
 --         specific_setup.settings = {
 --           languages = {
 --             solidity = {
 --               {
 --                 lintStdin = true,
 --                 lintIgnoreExitCode = true,
 --                 lintCommand = "solhint stdin", -- default is `-f stylish`
 --                 lintFormats = {
 --                   " %#%l:%c %#%tarning %#%m",
 --                   " %#%l:%c %#%trror %#%m",
 --                   " %#%l:%c %#%tote %#%m",
 --                   " %#%l:%c %m",
 --                 },
 --                 lintSource = "solhint",
 --               }
 --             }
 --           }
 --         }
 --       end
        lspconfig[lsp_string].setup(specific_setup)
      end

      require('lint').linters_by_ft = {
        solidity = { 'solhint' },
      }
      vim.api.nvim_create_autocmd({"BufEnter", "TextChanged", "InsertLeave"}, {
        pattern = {"*.sol",},
        callback = function()
          require("lint").try_lint()
        end,
      })

      require('symbols-outline').setup()
      vim.api.nvim_set_keymap("n", "<leader>so", '<CMD>SymbolsOutline<CR>', { silent = true, noremap = true })

      -- Setup Mason as early as possible
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      -- This uses Mason's Lua API to install LSPs if they are not already installed
      masonlspconfig.setup()
      masonlspconfig.setup({
        ensure_installed = {
--          "efm",
          "solidity",
        },
      })
      -- This uses Mason's Lua API to install packages if they are not already installed
      -- This occurs after solhint is configured, so you'll need to restart neovim
      local registry = require("mason-registry")
      for _, pkg_name in ipairs { "solhint", } do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
             pkg:install()
          end
        end
      end

      lspsettings.preset()

      -- (Optional) Configure lua language server for neovim
      lspconfig.cmd = 'LspInfo'
      lspconfig.event = { 'BufReadPre', 'BufNewFile' }
      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({ buffer = bufnr })
      end)

      lsp.setup()

      cmp.setup({
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<TAB>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<S-TAB>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

          -- Ctrl+Space to trigger completion menu
          -- ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })

      lspsaga.setup({})
    end,
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'glepnir/lspsaga.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' }, -- TODO: make sure this is working
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Linter
      { 'mfussenegger/nvim-lint' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- Outline
      { 'simrat39/symbols-outline.nvim' },
    },
  },
  "nvim-tree/nvim-web-devicons",
  "lambdalisue/suda.vim",
  "jeffkreeftmeijer/vim-numbertoggle",
  "airblade/vim-gitgutter",
  "itchyny/vim-gitbranch",
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        delay = 1000,
      })
    end
  },
  "jiangmiao/auto-pairs",
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    'kevinhwang91/nvim-fundo',
    dependencies = { 'kevinhwang91/promise-async' },
    build = function()
      require('fundo').install()
    end,
    config = function()
      vim.o.undofile = true
      require('fundo').setup()
    end
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- TODO: Make sure this is working as expected
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
      require("cmp").config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter
      }
    end
  },
})

--[[ add  to branch display --]]
-- -function _G.gitBranch()
-- -  return " " .. vim.fn["gitbranch#name"]()
-- -end
-- -
-- -function _G.gitStatus()
-- -  local hunk_summary = vim.fn['GitGutterGetHunkSummary']()
-- -  local a = hunk_summary[1]
-- -  local m = hunk_summary[2]
-- -  local r = hunk_summary[3]
-- -  return string.format('+%d ~%d -%d', a, m, r)
-- -end

-- Leaving these here for now, because https://github.com/itchyny/lightline.vim/issues/657
-- The issue is that currently the NeoVim version of `exists()` doesn't work with Lua functions.
--[[ Current kludge for gitBranch() --]]
-- vim.api.nvim_exec(
-- [[
-- function! g:VimGitBranch()
--   return " " .. gitbranch#name()
-- endfunction
-- function! GitStatus()
--   let [a,m,r] = GitGutterGetHunkSummary()
--   return printf('+%d ~%d -%d', a, m, r)
-- endfunction
-- ]],
-- true)

-- Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
-- - https://github.com/Valloric/YouCompleteMe
-- - https://github.com/nvim-lua/completion-nvim
-- vim.g.UltiSnipsExpandTrigger = "<c-l>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<c-h>"

-- --------------------------------------------
-- vim-latex-live setup
-- --------------------------------------------
-- vim:g.livepreview_previewer = 'evince'
-- vim.g:livepreview_engine = 'pdflatex'
vim.g.livepreview_use_biber = 0

-- --------------------------------------------
-- Compiler callbacks (:checkhealth)
-- --------------------------------------------
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.python3_host_prog = '/usr/bin/python3'


-- --------------------------------------------
-- Convenience mappings
-- --------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>n', '<CMD>noh <CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<CMD>lua print(vim.bo.filetype)<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('n', '<leader>nt', '<CMD>NERDTreeToggle<cr>', { silent = true, noremap = true })

-- autocmd BufNewFile,BufRead *.rs set filetype=rust
-- autocmd BufNewFile,BufRead *.nix set filetype=nix
-- autocmd BufNewFile,BufRead *.sol set filetype=solidity
-- autocmd BufNewFile,BufRead *.prisma set filetype=prisma
vim.filetype.add({
  extension = {
    sol = "solidity",
    rs = "rust",
    nix = "nix",
    prisma = "prisma",
  }
})

require('mymodule')
-- vim.api.nvim_command('source ~/.config/nvim/vimrc')
