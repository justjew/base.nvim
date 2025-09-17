return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup {}

    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

    -- swapping buffers between windows
    -- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    -- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    -- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    -- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
  end,
}
--
-- return {
--   'aserowy/tmux.nvim',
--   config = function()
--     require('tmux').setup {
--       copy_sync = {
--         -- enables copy sync. by default, all registers are synchronized.
--         -- to control which registers are synced, see the `sync_*` options.
--         enable = true,
--
--         -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
--         -- first buffer or named_buffer_name = true to ignore a named tmux
--         -- buffer with name named_buffer_name :)
--         ignore_buffers = { empty = false },
--
--         -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
--         -- clipboard by tmux
--         redirect_to_clipboard = true,
--
--         -- offset controls where register sync starts
--         -- e.g. offset 2 lets registers 0 and 1 untouched
--         register_offset = 0,
--
--         -- overwrites vim.g.clipboard to redirect * and + to the system
--         -- clipboard using tmux. If you sync your system clipboard without tmux,
--         -- disable this option!
--         sync_clipboard = false,
--
--         -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
--         sync_registers = true,
--
--         -- syncs deletes with tmux clipboard as well, it is adviced to
--         -- do so. Nvim does not allow syncing registers 0 and 1 without
--         -- overwriting the unnamed register. Thus, ddp would not be possible.
--         sync_deletes = true,
--
--         -- syncs the unnamed register with the first buffer entry from tmux.
--         sync_unnamed = true,
--       },
--       navigation = {
--         -- cycles to opposite pane while navigating into the border
--         cycle_navigation = true,
--
--         -- enables default keybindings (C-hjkl) for normal mode
--         enable_default_keybindings = true,
--
--         -- prevents unzoom tmux when navigating beyond vim border
--         persist_zoom = false,
--       },
--       resize = {
--         -- enables default keybindings (A-hjkl) for normal mode
--         enable_default_keybindings = true,
--
--         -- sets resize steps for x axis
--         resize_step_x = 1,
--
--         -- sets resize steps for y axis
--         resize_step_y = 1,
--       },
--     }
--   end,
-- }
