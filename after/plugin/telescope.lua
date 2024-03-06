
local builtin = require('telescope.builtin')


require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
            ".min."
		}
	},
    extensions = {
            zoxide = {
            prompt_title = "[ Walking on the shoulders of TJ ]",
            mappings = {
              default = {
                after_action = function(selection)
                  print("Update to (" .. selection.z_score .. ") " .. selection.path)
                end
              },
            }
        }}
}
