-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require("mason").setup()
require("mason-lspconfig").setup()


require'lspconfig'.ansiblels.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    ansible = {
      python = {
        activationScript = "/home/kpelletier/Projects/CI/Ansible/.venv/bin/activate"
      },
      validation = { 
        enabled = true,
        lint = {
          enabled = false
        },
      }
    }
  }
}

-- require'lspconfig'.jdtls.setup{}

require('telescope').setup {
  defaults = {},
  pickers = {
    buffers = {
      theme = "ivy"
    },
    find_files = {
      theme = "ivy"
    },
    git_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    }
  }
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.bashls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

require'lspconfig'.dockerls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

require'lspconfig'.gradle_ls.setup {
  cmd = {
    "/home/kpelletier/GitHub/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server"
  }
}

require'lspconfig'.groovyls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = {
    "java", "-jar", "/home/kpelletier/GitHub/groovy-language-server/build/libs/groovy-language-server-all.jar"
  }
}

require'lspconfig'.puppet.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = {
    "/home/kpelletier/GitHub/puppet-editor-services/puppet-languageserver", "--stdio", "--puppet-settings=--moduledir", "/home/kpelletier/Projects/Infra/puppet/modules"
  },
  filetypes = {
    "puppet"
  }
}

require'lspconfig'.pylsp.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

require'lspconfig'.terraformls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}


