return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    -- you'll need at least one of these
    { 'nvim-telescope/telescope.nvim' },
    { 'ibhagwan/fzf-lua' },
  },
  config = function()
    require('neoclip').setup {
      initial_mode = 'normal',
    }
    vim.keymap.set('i', '<C-y>', '<cmd>Telescope neoclip<cr>')
  end,
  keys = {
    { '<leader>yy', '<cmd>Telescope neoclip<cr>', desc = 'Neoclip [Y]anks telescope' },
    -- { 'i', '<C>y', '<cmd>Telescope neoclip<cr>', desc = 'Neoclip [Y]anks telescope' },
  },
}
