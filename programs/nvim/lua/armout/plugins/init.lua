require("lze").load {
  { "plenary.nvim",
    dep_of = { "neo-tree.nvim" }
  },

  { "nvim-web-devicons",
    dep_of = { "lualine", "neo-tree.nvim" }
  },
  
  { "nui.nvim",
	dep_of = { "neo-tree.nvim" }
  },

  { import = "armout.plugins.lualine" },
  { import = "armout.plugins.neo-tree" },
  { import = "armout.plugins.which-key" },
}
