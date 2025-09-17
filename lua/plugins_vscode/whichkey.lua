return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = {
      registers = true,
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  config = function()
    require('which-key').add {
      { '<leader>b', group = '[b]uffer' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>q', group = '[Q]uit' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>y', group = '[Y]anks' },
      { '<leader>t', group = '[T]abs' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>x', group = '[X] Debug' },
      { '<leader>n', group = '[N]oNeckPain' },
      { '<leader>,', group = 'Pick buffer' },
    }
  end,
}
