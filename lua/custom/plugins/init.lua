-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- copilot.vim for GitHub Copilot AI code completion
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Copilot 기본 단축키 설정 (옵션)
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true, replace_keycodes = false })
    end,
  },
  -- bufferline for tab management
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("bufferline").setup{}
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
    cmd = { "Git", "G" },
  },
  -- flutter/dart 개발을 위한 플러그인
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for enhanced UI
    },
    ft = { "dart" },
    config = function()
      require("flutter-tools").setup {
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
}
