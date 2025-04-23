return {
  "bufferline.nvim",
  after = function()
	local bufferline = require("bufferline")

	bufferline.setup({
	  options = {
		mode = "tabs",
		themable = true,
		offsets = {
		  {
			filetype = "neo-tree",
			text = "File Explorer",
			separator = true,
			text_align = "left"
		  },
		},

		color_icons = true,

	  }
	})
  end,
}
