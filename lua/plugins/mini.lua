return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    -- NOTE: disabled
    -- require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim

    -- require('mini.files').setup {}

    require('mini.icons').setup {}

    require('mini.tabline').setup {}

    require('mini.bufremove').setup {}

    require('mini.notify').setup {}

    require('mini.comment').setup {}

    -- require('mini.completion').setup {}
  end,
  keys = {
    { '<S-l>', '<cmd>bnext<cr>', desc = 'Next buffer' },
    { '<S-h>', '<cmd>bprev<cr>', desc = 'Previous buffer' },
    { '<leader>bx', '<cmd>lua MiniBufremove.delete()<cr>', desc = 'Close buffer' },
    { '<leader>bb', '<cmd>Telescope buffers<cr>', desc = 'List buffers' },
    {
      '<leader>bo',
      function()
        local bufs = vim.api.nvim_list_bufs()
        local current_buf = vim.api.nvim_get_current_buf()

        for _, i in ipairs(bufs) do
          local buf_ft = vim.api.nvim_buf_get_option(i, 'filetype')
          if i ~= current_buf and buf_ft ~= 'NvimTree' then
            vim.api.nvim_buf_delete(i, {})
          end
        end
      end,
      desc = 'Close [o]ther buffers',
    },
  },
}
