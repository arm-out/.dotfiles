return {
  "bufferline.nvim",
  after = function()
	local bufferline = require("bufferline")

	bufferline.setup({
	  options = {
		mode = "tabs",
		offsets = {
		  {
			filetype = "neo-tree",
			text = "",
			separator = false,
		  },
		},
	  }
	})
  end,
}
