local function default_header()
  return {
    '',
    '',
    '',
    '     @@@  @@@  @@@   @@@@@@   @@@@@@@       @@@  @@@@@@@@  @@@  @@@  @@@  ',
    '     @@@  @@@  @@@  @@@@@@@   @@@@@@@       @@@  @@@@@@@@  @@@  @@@  @@@  ',
    '     @@!  @@!  @@@  !@@         @@!         @@!  @@!       @@!  @@!  @@!  ',
    '     !@!  !@!  @!@  !@!         !@!         !@!  !@!       !@!  !@!  !@!  ',
    '     !!@  @!@  !@!  !!@@!!      @!!         !!@  @!!!:!    @!!  !!@  @!@  ',
    '     !!!  !@!  !!!   !!@!!!     !!!         !!!  !!!!!:    !@!  !!!  !@!  ',
    '     !!:  !!:  !!!       !:!    !!:         !!:  !!:       !!:  !!:  !!:  ',
    '!!:  :!:  :!:  !:!      !:!     :!:    !!:  :!:  :!:       :!:  :!:  :!:  ',
    '::: : ::  ::::: ::  :::: ::      ::    ::: : ::   :: ::::   :::: :: :::   ',
    ' : :::     : :  :   :: : :       :      : :::    : :: ::     :: :  : :',
    '',
    '',
    '',
  }
end

return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = default_header(),
        center = {
          {
            icon = '󰙅 ',
            icon_hl = 'Title',
            desc = 'Open tree',
            desc_hl = 'String',
            key = 'e',
            keymap = 'SPC e',
            key_hl = 'Number',
            action = ':Neotree float',
          },
          {
            icon = '󰈞 ',
            icon_hl = 'Title',
            desc = 'Find files',
            desc_hl = 'String',
            key = 'f',
            keymap = 'SPC f f',
            key_hl = 'Number',
            action = ':Telescope find_files',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find text',
            desc_hl = 'String',
            key = 'w',
            keymap = 'SPC f w',
            key_hl = 'Number',
            action = ':Telescope live_grep',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Git Braches',
            desc_hl = 'String',
            key = 'b',
            keymap = 'SPC g b',
            key_hl = 'Number',
            action = ':Telescope git_branches',
          },
          {
            icon = '󱀸 ',
            icon_hl = 'Title',
            desc = 'Restore session',
            desc_hl = 'String',
            key = 's',
            keymap = 'SPC q s',
            key_hl = 'Number',
            action = ':lua require("persistence").load()',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Lazy',
            desc_hl = 'String',
            key = 'l',
            action = ':Lazy',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'LazyGit',
            desc_hl = 'String',
            key = 'g',
            keymap = 'SPC g g',
            key_hl = 'Number',
            action = ':LazyGit',
          },
          {
            icon = '󰩈 ',
            icon_hl = 'Title',
            desc = 'Quit',
            desc_hl = 'String',
            key = 'q',
            keymap = 'SPC qa',
            key_hl = 'Number',
            action = ':qa!',
          },
        },
      },
    }
  end,
}