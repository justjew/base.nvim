return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        buffer_close_icon = '',
        mode = 'buffers',
        numbers = 'ordinal',
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
        sort_by = 'id',
        truncate_names = false,
      },
    }

    vim.keymap.set('n', '<s-l>', ':BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<s-h>', ':BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<c-i>', ':BufferLineMovePrev<CR>')
    vim.keymap.set('n', '<c-p>', ':BufferLineMoveNext<CR>')
    vim.keymap.set('n', '<leader>bx', ':BufferLinePickClose<CR>', { desc = 'Pick buffer to close' })
    vim.keymap.set('n', '<leader>bs', ':BufferLineSortByDirectory<CR>', { desc = 'Sort buffers' })
    vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close buffers to left' })
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close buffers to right' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Other buffers' })
    vim.keymap.set('n', '<leader>bi', '<cmd>wa<cr><cmd>BufferLineCloseOthers<cr>', { desc = 'Save all buffers and close others' })
    vim.keymap.set('n', '<leader>bp', '<cmd>wa<cr><cmd>BufferLineTogglePin<cr>', { desc = 'Toggle pin buffer' })
    vim.keymap.set('n', '<leader>b,', '<cmd>BufferLinePick<cr>', { desc = 'Pick tab' })

    vim.keymap.set('n', '<leader>,1', function()
      require('bufferline').go_to(1, true)
    end)
    vim.keymap.set('n', '<leader>,2', function()
      require('bufferline').go_to(2, true)
    end)
    vim.keymap.set('n', '<leader>,3', function()
      require('bufferline').go_to(3, true)
    end)
    vim.keymap.set('n', '<leader>,4', function()
      require('bufferline').go_to(4, true)
    end)
    vim.keymap.set('n', '<leader>,5', function()
      require('bufferline').go_to(5, true)
    end)
    vim.keymap.set('n', '<leader>,6', function()
      require('bufferline').go_to(6, true)
    end)
    vim.keymap.set('n', '<leader>,7', function()
      require('bufferline').go_to(7, true)
    end)
    vim.keymap.set('n', '<leader>,8', function()
      require('bufferline').go_to(8, true)
    end)
    vim.keymap.set('n', '<leader>,9', function()
      require('bufferline').go_to(9, true)
    end)
    vim.keymap.set('n', '<leader>,0', function()
      require('bufferline').go_to(10, true)
    end)
    vim.keymap.set('n', '<leader>,$', function()
      require('bufferline').go_to(-1, true)
    end)
  end,
}
