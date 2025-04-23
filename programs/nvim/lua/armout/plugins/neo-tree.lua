return {
  "neo-tree.nvim",
  opts = {
	window = {
	  width = 30
	}
  },
  after = function()
	vim.keymap.set('n', "<Tab>", ":Neotree filesystem toggle<CR>", { desc = "Toggle Neotree sidebar" })

	require("neo-tree").setup({
	  window = {
		width = 30
	  }
	})
  end
}

