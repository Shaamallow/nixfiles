return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      {
        '<leader>gp',
        ':Gitsigns preview_hunk<CR>',
      },
      {
        '<leader>gb',
        ':Gitsigns blame<CR>',
        desc = 'git blame',
      },
    },
    opts = {
      preview_config = {
        border = 'rounded',
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
