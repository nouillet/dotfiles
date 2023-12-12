return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "VonHeikemen/lsp-zero.nvim"
  },

  config = function()

    local lsp_zero = require("lsp-zero")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    mason.setup({})
    mason_lspconfig.setup({
      ensure_installed = {
        'ansiblels',
        'bashls',
        'docker_compose_language_service',
        'dockerls',
        'lua_ls',
        'pylsp',
        'pyright',
        'terraformls'
      },
      handlers = {
        lsp_zero.default_setup,
      },
      -- -- Example for overrides
      -- require('lspconfig').ansiblels.setup({
      --   settings = {
      --     ansible = {
      --       ansible = {
      --         path = "/home/nouillet/Projects/Ansible/"
      --       },
      --       python = {
      --         interpreterPath = "/home/nouillet/Projects/Ansible/.venv/"
      --       }
      --     }
      --   },
      -- })
    })

    --local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
    --if not lsp_status_ok then
    --  return
    --end

    --local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    --if not cmp_status_ok then
    --  return
    --end

    ---- Add additional capabilities supported by nvim-cmp
    ---- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
    --local capabilities = vim.lsp.protocol.make_client_capabilities()
    --capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    ---- Use an on_attach function to only map the following keys
    ---- after the language server attaches to the current buffer
    --local on_attach = function(client, bufnr)
    --  -- Enable completion triggered by <c-x><c-o>
    --  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    --  -- Highlighting references.
    --  -- See: https://sbulav.github.io/til/til-neovim-highlight-references/
    --  -- for the highlight trigger time see: `vim.opt.updatetime`
    --  if client.server_capabilities.documentHighlightProvider then
    --    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    --    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    --    vim.api.nvim_create_autocmd("CursorHold", {
    --      callback = vim.lsp.buf.document_highlight,
    --      buffer = bufnr,
    --      group = "lsp_document_highlight",
    --      desc = "Document Highlight",
    --    })
    --    vim.api.nvim_create_autocmd("CursorMoved", {
    --      callback = vim.lsp.buf.clear_references,
    --      buffer = bufnr,
    --      group = "lsp_document_highlight",
    --      desc = "Clear All the References",
    --    })
    --  end

    --  -- Mappings.
    --  -- See `:help vim.lsp.*` for documentation on any of the below functions
    --  local bufopts = { noremap=true, silent=true, buffer=bufnr }
    --  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    --  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    --  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    --  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    --  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    --  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    --  vim.keymap.set('n', '<space>wl', function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --  end, bufopts)
    --  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    --  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    --  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    --  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    --end

    ---- Diagnostic settings:
    ---- see: `:help vim.diagnostic.config`
    ---- Customizing how diagnostics are displayed
    --vim.diagnostic.config({
    --  update_in_insert = true,
    --  float = {
    --    focusable = false,
    --    style = "minimal",
    --    border = "rounded",
    --    source = "always",
    --    header = "",
    --    prefix = "",
    --  },
    --})

    ---- Show line diagnostics automatically in hover window
    --vim.cmd([[
    --  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
    --]])

    ---- Mappings.
    ---- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    --vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    --vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    --vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


    ---- Define `root_dir` when needed
    ---- See: https://github.com/neovim/nvim-lspconfig/issues/320
    ---- This is a workaround, maybe not work with some servers.
    --local root_dir = function()
    --  return vim.fn.getcwd()
    --end

    --local lsp_flags = { debounce_text_changes = 150 }

    --require'lspconfig'.ansiblels.setup {
    --  on_attach = on_attach,
    --  flags = lsp_flags,
    --  settings = {
    --    ansible = {
    --      python = {
    --        activationScript = "/home/nouillet/.pyenv/versions/ansible/bin/activate"
    --      },
    --      validation = {
    --        enabled = true,
    --        lint = {
    --          enabled = true
    --        },
    --      }
    --    }
    --  }
    --}

    --require'lspconfig'.bashls.setup {
    --  on_attach = on_attach,
    --  flags = lsp_flags,
    --  cmd = {
    --    "/home/nouillet/.local/share/nvim/mason/bin/bash-language-server",
    --    "start"
    --  }
    --}

    --require'lspconfig'.dockerls.setup {
    --  on_attach = on_attach,
    --  flags = lsp_flags,
    --  cmd = {
    --    "/home/nouillet/.local/share/nvim/mason/bin/docker-langserver",
    --    "--stdio"
    --  }
    --}

    --require'lspconfig'.docker_compose_language_service.setup { on_attach = on_attach,
    --  flags = lsp_flags,
    --  cmd = {
    --    "/home/nouillet/.local/share/nvim/mason/bin/docker-compose-langserver",
    --    "--stdio"
    --  }
    --}

    --require'lspconfig'.lua_ls.setup({})

    --require'lspconfig'.pylsp.setup {
    --  on_attach = on_attach,
    --  flags = lsp_flags,
    --  cmd = {
    --    "/home/nouillet/.local/share/nvim/mason/bin/pylsp"
    --  }
    --}
  end
}
