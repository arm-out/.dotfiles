return {
  {
	"nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	on_require = { "lspconfig" },
	lsp = function(plugin)
	  vim.lsp.config(plugin.name, plugin.lsp or {})
	  vim.lsp.enable(plugin.name)
	end,
	after = function()
	  local lspconfig = require("lspconfig")
	  local capabilities = require("blink.cmp").get_lsp_capabilities()

	  lspconfig['lua_ls'].setup({
		filetypes = { 'lua' },
		settings = {
		  Lua = {
			runtime = { version = 'LuaJIT' },
			formatters = {
			  ignoreComments = true,
			},
			signatureHelp = { enabled = true },
			diagnostics = {
			  globals = { "nixCats", "vim", },
			  disable = { 'missing-fields' },
			},
			telemetry = { enabled = false },
		  },
		},
		capabilities = capabilities,
	  })

	  lspconfig['nixd'].setup({
		filetypes = { 'nix' },
		settings = {
		  nixd = {
			nixpkgs = {
			  expr = nixCats.extra("nixdExtras.nixpkgs") or [[import >nixpkgs> {}]],
			},
			options = {
			  nixos = {
				expr = nixCats.extra("nixdExtras.nixos_options")
			  }
			},
			formatting = {
			  command = { "nixfmt" }
			},
			diagnostics = {
			  surpress = {
				"sema-escaping-with"
			  }
			}
		  }
		}
	  })

	end
  },
  {
    "lazydev.nvim",
    cmd = { "LazyDev" },
    ft = "lua",
    after = function(_)
      require('lazydev').setup({
        library = {
          { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. '/lua' },
        },
      })
    end,
  },
  {
    "lua_ls",
	dep_of = { "nvim-lspconfig" },
  },
  {
	"nixd",
	dep_of = { "nvim-lspconfig" }
  }
}
