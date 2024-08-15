-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Highlight word under cursor
  { 'RRethy/vim-illuminate' },

  -- Show diagnostics
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xd',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
    -- config = function()
    --   vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
    --   vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
    --   vim.keymap.set('n', '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
    --   vim.keymap.set('n', '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' })
    --   vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
    --   vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })
    -- end,
  },

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
