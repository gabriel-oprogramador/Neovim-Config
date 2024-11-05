require("plugs.gruvbox-config")
require("plugs.airline-config")
require("plugs.mason-config")
require("plugs.lsp-config")
require('telescope').setup {
    defaults = {
      file_ignore_patterns = {
        "%.git",
        "%.cache",
        "%.png",
        "%.jpg",
        "%.jpeg",
        "%.o",
        ".cache",
        "Build"
        },
    },
}
