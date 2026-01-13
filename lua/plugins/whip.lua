-- example lazy nvim config
return {
  'slugbyte/whip.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local whip = require 'whip'
    whip.setup {
      -- its probs a good idea to have a dir dedicated to your scratchpads
      dir = '/Users/justjew/.whip/scratches',
      autocreate = true, -- Autocreates a whip file if the results list is empty when using whip.find_file
    }
    vim.keymap.set('', '<leader>no', whip.open, { desc = '[W]hip [O]pen' })
    vim.keymap.set('', '<leader>nm', whip.make, { desc = '[W]hip [M]ake' })
    vim.keymap.set('', '<leader>nd', whip.drop, { desc = '[W]hip [D]rop' })
    vim.keymap.set('', '<leader>nf', whip.find_file, { desc = '[W]hip [F]ile Search' })
    vim.keymap.set('', '<leader>ng', whip.find_grep, { desc = '[W]hip [G]rep Search' })
  end,
}
