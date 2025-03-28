require('material').setup({
    contrast = {
	terminal = true,
	sidebars = true,
	floating_windows = true,
	cursor_line = true,
	lsp_virtual_text = true,
	non_current_windows = false,
    },
    styles = {},
    plugins = {},
    high_visibility = { darker = true },
    lualine_style = "default",
    async_loading = true,
    custom_colors = nil,
    custom_highlights = {},
})
