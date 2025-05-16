return {
	"conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout = 1000,
			},
		})

		vim.keymap.set({ "n", "v", "i" }, "<C-s>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format current buffer" })
	end,
}
