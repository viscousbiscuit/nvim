
local opts = {
    auto_close = true,
    autofold_depth = 2,
    symbols = {
        Namespace = { icon = "", hl = "@namespace"},
    }
}
require("symbols-outline").setup(opts)

