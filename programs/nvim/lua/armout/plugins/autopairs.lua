return {
  "nvim-autopairs",
  event = { "InsertEnter" },
  after = function()
	local autopairs = require("nvim-autopairs")
	autopairs.setup({
	  check_ts = true,
	})
  end,
}

