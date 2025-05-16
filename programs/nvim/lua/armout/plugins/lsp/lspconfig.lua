return {
	{
		"nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		on_require = { "lspconfig" },
		after = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local keymap = vim.keymap

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					-- keybinds
					opts.desc = "Show LSP references"
					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "Go to declaration"
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

					opts.desc = "Show LSP definitions"
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

					opts.desc = "Show LSP implementations"
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

					opts.desc = "Show LSP type definitions"
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

					opts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

					opts.desc = "Smart rename"
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

					opts.desc = "Show buffer diagnostics"
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

					opts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

					opts.desc = "Show documentation for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Restart LSP"
					keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			})

			lspconfig["lua_ls"].setup({
				filetypes = { "lua" },
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						signatureHelp = { enabled = true },
						diagnostics = {
							globals = { "nixCats", "vim" },
							disable = { "missing-fields" },
						},
						telemetry = { enabled = false },
					},
				},
				capabilities = capabilities,
			})

			lspconfig["nixd"].setup({
				filetypes = { "nix" },
				settings = {
					nixd = {
						nixpkgs = {
							expr = nixCats.extra("nixdExtras.nixpkgs") or [[import >nixpkgs> {}]],
						},
						options = {
							nixos = {
								expr = nixCats.extra("nixdExtras.nixos_options"),
							},
						},
						formatting = {
							command = { "nixfmt" },
						},
						diagnostics = {
							surpress = {
								"sema-escaping-with",
							},
						},
					},
				},
			})
		end,
	},
	{
		"lazydev.nvim",
		cmd = { "LazyDev" },
		ft = "lua",
		after = function(_)
			require("lazydev").setup({
				library = {
					{ words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. "/lua" },
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
		dep_of = { "nvim-lspconfig" },
	},
}
