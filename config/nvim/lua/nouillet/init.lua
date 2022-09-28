require("mason").setup()
require("mason-lspconfig").setup()

require'lspconfig'.ansiblels.setup{
    settings = {
        ansible = {
            ansibleLint = {
                enabled = false
            },
            python = {
                interpreterPath = "/home/kpelletier/Projects/CI/Ansible/.venv/bin/python"
            }
        }
    }
}

require'lspconfig'.jdtls.setup{}
