return {
  {
	"friendly-snippets",
	dep_of = { "blink.cmp", "luasnip" },
  },
  {
	"luasnip",
	dep_of = { "blink.cmp" },
	after = function()
	  local luasnip = require("luasnip")
	  require("luasnip.loaders.from_vscode").lazy_load()
	  luasnip.config.setup({})
	end,
  },
  {
	"colorful-menu.nvim",
	on_plugin = { "blink.cmp" },
  },
  {
	"blink.cmp",
	dep_of = { "nvim-lspconfig" },
	after = function()
	  require("blink.cmp").setup({
		keymap = {
		  preset = "enter",
		  ['<C-j>'] = { 'select_next', 'fallback' },
		  ['<C-k>'] = { 'select_prev', 'fallback' },
		},
  
		cmdline = {
		  enabled = true,
		  completion = {
			menu = {
			  auto_show = true,
			},
		  },
		},

		appearance = {
		  nerd_font_variant = "mono",
		},

		completion = { 
		  menu = {
			draw = {
			  treesitter = { "lsp" },
			  components = {
				label = {
				  text = function(ctx)
					return require("colorful-menu").blink_components_text(ctx)
				  end,
				  highlight = function(ctx)
					return require("colorful-menu").blink_components_highlight(ctx)
				  end,
				},
			  },
			},
		  },
		  documentation = { auto_show = true }
		},

		signature = {
		  enabled = true,
		  window = { show_documentation = false },
		},

		sources = {
		  default = { "lsp", "path", "snippets", "buffer" },
		},
		
		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "prefer_rust_with_warning" }
	  })
	end,
  },
}
  

