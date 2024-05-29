return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        buffer_close_icon = '',
        mode = 'buffers',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            separator = true,
            padding = 1,
          },
        },
        diagnostics = 'nvim_lsp',
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
        separator_style = 'thick',
        show_close_icon = false,
        sort_by = 'insert_at_end',
        truncate_names = false,
      },
    }

    vim.keymap.set('n', '<s-l>', ':BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<s-h>', ':BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<c-i>', ':BufferLineMovePrev<CR>')
    vim.keymap.set('n', '<c-p>', ':BufferLineMoveNext<CR>')
    vim.keymap.set('n', '<leader>bx', ':BufferLinePickClose<CR>', { desc = 'Pick buffer to close' })
    vim.keymap.set('n', '<leader>bs', ':BufferLineSortByTabs<CR>', { desc = 'Sort buffers' })
    vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close buffers to left' })
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close buffers to right' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Other buffers' })
  end,
}
