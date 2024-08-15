return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  ft = 'dart',
  config = function()
    require('flutter-tools').setup {
      flutter_path = nil,
      flutter_lookup_cmd = 'asdf where flutter',
      statusline = {
        app_version = true,
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = '■', -- the virtual text character to highlight
        },
      },
    }
    require('flutter-tools.lsp').attach()
  end,
}

-- debugger = {
--   enabled = true,
--   run_via_dap = true,
--   exception_breakpoints = {},
--   register_configurations = function()
--     local dap = require 'dap'
--     local dap_helper = require 'custom.helpers.dapfunc'
--
--     dap.configurations.dart = {
--       {
--         type = 'dart',
--         request = 'launch',
--         name = 'Launch dart',
--         program = 'bin/wl_generator.dart',
--         cwd = '${workspaceFolder}',
--         toolArgs = { 'publish', 'hoodoo' },
--         -- toolArgs = dap_helper.set_env,
--       },
--       {
--         type = 'dart',
--         request = 'launch',
--         name = 'Launch main',
--         program = 'lib/main.dart',
--         cwd = '${workspaceFolder}',
--         toolArgs = dap_helper.set_env,
--       },
--       {
--         type = 'dart',
--         request = 'launch',
--         name = 'Launch example',
--         program = '${workspaceFolder}/lib/main.dart',
--         cwd = '${workspaceFolder}/example',
--         toolArgs = dap_helper.set_env,
--       },
--       {
--         type = 'dart',
--         request = 'launch',
--         name = 'Launch relative',
--         cwd = dap_helper.input_cwd,
--         program = 'lib/main.dart',
--         toolArgs = dap_helper.set_env,
--       },
--     }
--   end,
-- },
