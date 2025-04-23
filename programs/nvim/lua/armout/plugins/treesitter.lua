return {
  "nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  after = function()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
	  highlight = { enable = true },
	  indent = { enable = true },
	  autotag = { enable = true },
	  incremental_selection = {
		enable = true,
		keymaps = {
		  init_selection = "<C-space>",
		  node_incremental = "<C-space>",
		  sccope_incremental = false,
		  node_decremental = "<bs>",
		},
	  },
	})
  end,
}

