-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
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
}
