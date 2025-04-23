return {
  "which-key.nvim",
  event = "DeferredUIEnter",
  before = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 500
  end
}
