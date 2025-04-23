require("lze").load {
  { "plenary.nvim",
    dep_of = { "neo-tree.nvim", "telescope.nvim" }
  },

  { "nvim-web-devicons",
    dep_of = { "lualine", "neo-tree.nvim", "telescope.nvim" }
  },
  
  { "nui.nvim",
	dep_of = { "neo-tree.nvim" }
  },

  { "telescope-fzf-native.nvim" },
  { "telescope-ui-select.nvim" },

  { import = "armout.plugins.lualine" },
  { import = "armout.plugins.neo-tree" },
  { import = "armout.plugins.which-key" },
  { import = "armout.plugins.telescope" },
}
