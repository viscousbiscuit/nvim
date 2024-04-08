return {
    'nvim-telescope/telescope.nvim',
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".min.js"
                },
            }
        }
    end

}
