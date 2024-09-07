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
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = true,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = true,
          -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
          -- this will show the currently selected project configuration
          project_config = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        -- register_configurations = function(_)
        --   require('dap').configurations.dart = {}
        --   require('dap.ext.vscode').load_launchjs()
        -- end,
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
      outline = {
        open_cmd = '30vnew', -- command to use to open the outline buffer
        auto_open = false, -- if true this will open the outline automatically when it is first populated
      },
    }
    require('flutter-tools.lsp').attach()
  end,
}
