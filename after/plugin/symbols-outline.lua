
local opts = {
    auto_close = true,
    autofold_depth = 1,
    symbols = {
        Namespace = { icon = "", hl = "@namespace"},
    }
}
require("symbols-outline").setup(opts)

