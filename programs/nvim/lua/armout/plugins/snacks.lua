return {
  "snacks.nvim",
  after = function()
	require("snacks").setup({
	  bigfile = { enabled = true },
	  indent = { enabled = true, animate = { enabled = false } },
	  quickfile = { enabled = true },
	  rename = { enabled = true },
	  scope = { enabled = true },
	  scroll = { enabled = true },
	  statuscolumn = { enabled = true },
	  input = { enabled = true }
	})
  end
}







