vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Split window horizontally" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower pane" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper pane" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- tab management
keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<C-w>", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<C-d>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<C-a>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
