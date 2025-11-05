return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "codestral",
					opts = {
						url = "http://localhost:11434",
						model = "codestral",
						vision = true,
						stream = true,
					},
					schema = {
						model = {
							default = "codestral",
						},
						num_ctx = {
							default = 16384,
						},
						think = {
							default = false,
						},
						keep_alive = {
							default = "5m",
						},
					},
				})
			end,
		},
	},
}
