return {
  'RRethy/vim-illuminate',
  config = function()
    -- default configuration
    require('illuminate').configure {
      -- delay: delay in milliseconds
      delay = 100,
      under_cursor = true,
      min_count_to_highlight = 2,
      -- case_insensitive_regex: sets regex case sensitivity
      case_insensitive_regex = false,
      -- disable_keymaps: disable default keymaps
      disable_keymaps = false,
    }
  end,
}
