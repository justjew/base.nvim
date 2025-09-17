return {
  'akinsho/flutter-tools.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  ft = 'dart',
  config = function()
    require('flutter-tools').setup {
      flutter_path = nil,
      flutter_lookup_cmd = 'asdf where flutter',
      fvm = false,
      widget_guides = { enabled = true },
      lsp = {
        settings = {
          showTodos = false,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            vim.fn.expand '$Home/.pub-cache',
          },
          renameFilesWithClasses = 'prompt',
          updateImportsOnRename = true,
          -- enablesnippets = false,
        },
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = '■', -- the virtual text character to highlight
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
          local dap = require 'dap'
          -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
          dap.adapters.dart = {
            type = 'executable',
            command = paths.flutter_bin,
            args = { 'debug-adapter' },
          }
          -- dap.configurations.dart = {}
          -- require('dap.ext.vscode').load_launchjs()
        end,
      },
    }
    require('flutter-tools.lsp').attach()
  end,
}
