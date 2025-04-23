return {
  "lualine.nvim",
  event = "DeferredUIEnter",
  after = function (plugin)
	require('lualine').setup({
	  options = {
		icons_enabled = true,
		theme = 'material',
	  }
	})
  end,
}
