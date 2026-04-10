return {
  -- Gitsigns: For gutter signs and inline actions
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      {
        '<leader>gp',
        ':Gitsigns preview_hunk<CR>',
        desc = 'Preview hunk',
      },
      {
        '<leader>gb',
        ':Gitsigns blame<CR>',
        desc = 'Git blame (inline)',
      },
      {
        '<leader>gr',
        ':Gitsigns reset_hunk<CR>',
        desc = 'Git reset hunk',
      },
    },
    opts = {
      preview_config = {
        border = 'rounded',
      },
    },
  },

  -- Lazygit: For macro-level repo management, staging, and commits
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },

  -- Vim-Fugitive: For native Vim diff splits and CLI commands
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gblame' },
    keys = {
      { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'Git diff split (vertical)' },
      { '<leader>gB', '<cmd>Git blame<cr>', desc = 'Git blame (full buffer)' },
    },
  },

  -- Diffview: For navigating project-wide diffs and file history
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
    keys = {
      { '<leader>do', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open (Workspace)' },
      { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Diffview Close' },
      { '<leader>dh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview History (Current File)' },
      { '<leader>dH', '<cmd>DiffviewFileHistory<cr>', desc = 'Diffview History (All Commits)' },
    },
    opts = {
      enhanced_diff_hl = true, -- See better diff highlights
      view = {
        default = {
          winbar_info = true, -- Shows helpful info in the window bar
        },
      },
    },
  },
}
