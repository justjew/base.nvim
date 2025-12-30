-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local daprepl = require 'dap.repl'
    local dapui = require 'dapui'

    dap.adapters.codelldb = {
      type = 'executable',
      command = '/Users/justjew/.local/share/nvim/mason/bin/codelldb',
    }

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
      },
    }
    -- require'dap.repl'.execute('.hot-reload')
    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F8>', dap.terminate, { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<F9>', function()
      vim.bo.modifiable = true
      vim.api.nvim_buf_set_lines(0, 0, -1, true, {})
    end, { desc = 'Debug: Clean REPL' })

    vim.keymap.set('n', '<leader>di', dapui.eval, { desc = 'Debug: Evaluate expression' })
    vim.keymap.set('v', '<leader>di', dapui.eval, { desc = 'Debug: Evaluate expression' })
    vim.keymap.set('n', '<leader>du', dapui.open, { desc = 'Debug: Open DAP UI' })

    vim.keymap.set('n', '<leader>dr', function()
      daprepl.execute '.hot-reload'
    end, { desc = 'Debug: Flutter Hot Reload' })

    vim.keymap.set('n', '<leader>dR', function()
      daprepl.execute '.hot-restart'
    end, { desc = 'Debug: Flutter Hot Restart' })

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })

    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.3,
            },
            {
              id = 'breakpoints',
              size = 0.2,
            },
            {
              id = 'stacks',
              size = 0.3,
            },
            {
              id = 'watches',
              size = 0.2,
            },
          },
          position = 'left',
          size = 25,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 0.85,
            },
            {
              id = 'console',
              size = 0.15,
            },
          },
          position = 'bottom',
          size = 15,
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    vim.keymap.set('n', '<leader>dl', function()
      dapui.toggle {
        layout = 2,
      }
    end, { desc = 'Debug: Show REPL layout' })

    vim.keymap.set('n', '<leader>dk', function()
      dapui.toggle {
        layout = 1,
      }
    end, { desc = 'Debug: Show REPL layout' })

    -- dap.listeners.after.event_initialized['dapui_config'] = function()
    --   dapui.toggle {
    --     layout = 2,
    --   }
    -- end
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
  end,
}
