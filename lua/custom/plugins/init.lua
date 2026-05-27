-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- bufferline for tab management
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {}
      -- 모든 파일에 대해 indent를 whitespace 2칸으로 통일
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
      vim.opt.expandtab = true
    end,
  },
  -- vim-fugitive for git blame/log
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G' },
  },
  -- flutter/dart 개발을 위한 플러그인
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for enhanced UI
    },
    ft = { 'dart' },
    config = function()
      require('flutter-tools').setup {
        lsp = {
          color = { enabled = true },
          on_attach = function(_, bufnr)
            -- dartfmt 자동 포맷팅 등 추가 설정 가능
          end,
        },
        debugger = { -- flutter-tools에서 dap 연동
          enabled = true,
          run_via_dap = true,
        },
      }
    end,
  },


  -- crates.io 종속성 관리를 위한 플러그인
  {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },

  -- Rust 개발 환경 강화 (rustaceanvim)
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
            },
          },
        },
        -- DAP configuration
        dap = {
        },
      }
    end,
  },

  -- JSX/TSX 태그 자동 닫기 (Next.js 효율)
  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Git 워크플로우 개선 (Neogit)
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',         -- required
      'sindrets/diffview.nvim',        -- optional - Diff integration
      'nvim-telescope/telescope.nvim', -- optional
    },
    cmd = 'Neogit',
    config = true,
  },

  -- Git Diff 뷰어 (Diffview)
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
  },

  -- Markdown Preview (브라우저에서 미리보기)
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && npm install',
  },
}