local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    cmd = {
      '/home/nouillet/.sdkman/candidates/java/17.0.5-amzn/bin/java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms3g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar' ,'/home/nouillet/Projects/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', '/home/nouillet/Projects/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux',
      '-data', '/home/nouillet/.local/share/jdtls/' .. project_name
    },


    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-11",
              path = "/home/nouillet/.sdkman/candidates/java/11.0.17-amzn/"
            },
            {
              name = "JavaSE-1.8",
              path = "/home/nouillet/.sdkman/candidates/java/8.0.352-amzn/"
            }
          }
        }
      }
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  }
require('jdtls').start_or_attach(config)
