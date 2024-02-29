local config = {
    cmd = {'/home/lars/dotfiles/.config/nvim/jdtls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
