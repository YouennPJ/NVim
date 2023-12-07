local config = {
    cmd = {'/usr/lib/jvm/java-17-openjdk-amd64/bin/java'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
