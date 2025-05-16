return {
  "todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dep_of = { "telescope.nvim", "trouble.nvim" },
  after = function()
    local todo_comments = require("todo-comments")
    todo_comments.setup()
  end,
}
