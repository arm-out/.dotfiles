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
	  },
	  close_if_last_window = true,
	  use_popups_for_input = false,	
	})
  end
}

