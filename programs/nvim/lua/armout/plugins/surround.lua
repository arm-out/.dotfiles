return {
  "nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  after = function()
    local surround = require("nvim-surround")
    surround.setup()
  end,
}
