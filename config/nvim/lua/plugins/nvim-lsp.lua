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
        'gopls',
        'pylsp',
        'pyright',
        'terraformls'
      },
      handlers = {
        lsp_zero.default_setup,
      },

      require('lspconfig').gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
    })

    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

    require'lspconfig'.ansiblels.setup {
      settings = {
        ansible = {
          python = {
            activationScript = "/home/kpelletier/.pyenv/versions/ansible/bin/activate"
          ,
          validation = {
            enabled = true,
            lint = {
              enabled = true
            },
          }
        }
      }
    }
  }

  end
}
