-- LSP setup

-- Run the organize imports command from tsserver
local function tsserver_organize_imports()
  local command = {
    command = '_typescript.organizeImports',
  }
  vim.lsp.client:exec_cmd(command)
end

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = bufnr, desc = 'References' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Declaration' })
  vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = bufnr, desc = 'Definitions' })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type Definition' })
  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover({ border = 'rounded', max_height = 25, max_width = 120 })
  end, { buffer = bufnr, desc = 'Hover' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
  vim.keymap.set('n', 'gi', builtin.lsp_implementations, { buffer = bufnr, desc = 'Implementations' })
  vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { buffer = bufnr, desc = 'Format' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'folke/lazydev.nvim', 'b0o/SchemaStore.nvim' },
    event = 'VeryLazy',
    config = function()
      -- LSP CONFIGURATION
      -- List of LSP servers to install + configurations
      local servers = {
        texlab = {
          settings = {
            texlab = {
              diagnostics = {
                ignoredPatterns = { 'Overfull', 'Underfull' },
              },
            },
          },
        },
        lua_ls = true,
        rust_analyzer = true,
        bashls = {
          on_attach = function(client, bufnr)
            -- Disable the language server for files in *.env
            local file_name = vim.api.nvim_buf_get_name(bufnr)
            if file_name:match('%.env$') then
              client.stop() -- Stop the client if it's a .env or .example.env file
              return
            end
            on_attach(client, bufnr)
          end,
        },
        clangd = true,
        cmake = true,
        cssls = true,
        dockerls = true,
        eslint = true,
        html = true,
        -- htmx = true,
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
        marksman = true,
        pyright = true,
        svelte = true,
        taplo = true, --toml
        tailwindcss = false,
        ts_ls = {
          on_attach = function(client, bufnr)
            -- On tsserver attach, add additional keymaps for organizing imports
            vim.keymap.set('n', '<leader>oi', tsserver_organize_imports, { buffer = bufnr })
            on_attach(client, bufnr)
          end,

          commands = {
            OrganizeImports = {
              tsserver_organize_imports,
              description = 'Organize Imports',
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = '',
              },
              -- Remove Sigma schema (interferes with sigma)
              schemas = require('schemastore').yaml.schemas({ ignore = { 'Sigma Detection Rule' } }),
            },
          },
        },
        nil_ls = true,
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Hook all servers
      for lsp, config in pairs(servers) do
        if config ~= false then
          ---@diagnostic disable-next-line: redefined-local
          local config = (config == true) and {} or config
          config = vim.tbl_deep_extend('force', { capabilities = capabilities, on_attach = on_attach }, config)
          vim.lsp.config(lsp, config)
          vim.lsp.enable(lsp)
        end
      end

      -- Some keymaps to reload common language servers
      vim.keymap.set(
        'n',
        '<leader>rp',
        '<CMD>LspRestart pyright<CR>',
        { silent = true, desc = 'Restart Pyright', noremap = true }
      )
      vim.keymap.set(
        'n',
        '<leader>rt',
        '<CMD>LspRestart tsserver<CR>',
        { silent = true, desc = 'Restart TSserver', noremap = true }
      )
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
