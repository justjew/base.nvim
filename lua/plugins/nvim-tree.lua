return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 50,
      },
      filters = {
        dotfiles = false,
      },
    }
  end,
  keys = {
    { '<leader>e', '<cmd>:NvimTreeFindFile<cr>', desc = '[E]xplore files' },
  },
}
