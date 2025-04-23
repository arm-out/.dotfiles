return {
  "alpha-nvim",
  event = "VimEnter",
  after = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
	  [[                                           __      ]],
	  [[                                          /\ \__   ]],
	  [[   __     _ __    ___ ___     ___   __  __\ \ ,_\  ]],
	  [[ /'__`\  /\`'__\/' __` __`\  / __`\/\ \/\ \\ \ \/  ]],
	  [[/\ \L\.\_\ \ \/ /\ \/\ \/\ \/\ \L\ \ \ \_\ \\ \ \_ ]],
	  [[\ \__/.\_\\ \_\ \ \_\ \_\ \_\ \____/\ \____/ \ \__\]],
	  [[ \/__/\/_/ \/_/  \/_/\/_/\/_/\/___/  \/___/   \/__/]],
	  [[                                                   ]],
	}

	dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("TAB", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }
                          
	alpha.setup(dashboard.opts)
	vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
                                                   


