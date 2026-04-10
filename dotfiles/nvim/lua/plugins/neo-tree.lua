return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      sources = { 'filesystem', 'buffers', 'document_symbols' },
      close_if_last_window = true,
      window = {
        mappings = {
          ['<space>'] = 'none',
          ['h'] = 'close_node', -- Fold
          ['l'] = 'open', -- Expand
          -- CUSTOM: Press 'A' to Harpoon the file under cursor
          ['A'] = function(state)
            local node = state.tree:get_node()
            require('harpoon'):list():add({
              value = node.path,
              context = { row = 1, col = 0 },
            })
            vim.notify('󱡀 Harpooned: ' .. node.name)
          end,
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { '.git', 'venv', 'node_modules' },
        },
      },
    },
    keys = {
      { '<leader>e', '<cmd>Neotree filesystem toggle left<cr>', desc = 'Explorer' },
      { '<leader>fs', '<cmd>Neotree document_symbols toggle left<cr>', desc = 'Document Symbols' },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<space>-' },
      { '-' },
    },
    config = function()
      require('oil').setup({
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          border = 'rounded',
        },
      })

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window
      vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
    end,
  },
}
