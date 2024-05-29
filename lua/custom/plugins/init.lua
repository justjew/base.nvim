-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Highlight word under cursor
  { 'RRethy/vim-illuminate' },

  -- Show diagnostics
  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- Restore session
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = { options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' } },
  },

  -- UI inputs (needed for flutter-tools)
  { 'stevearc/dressing.nvim' },

  -- LazyGit
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
  },
}
