require("material").setup({
  contrast = {
	terminal = true,
	sidebars = true,
	floating_windows = true,
	cursor_line = true,
	lsp_virtual_text = true,
  },

  plugins = {
	"nvim-web-devicons",
	"neo-tree",
	"telescope",
	"which-key",
  },

  lualine_style = "stealth",
  async_loading = "true",
})

vim.g.material_style = "darker"
vim.cmd("colorscheme material")

