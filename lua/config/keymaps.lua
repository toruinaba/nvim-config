local keymap = vim.keymap.set
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",  { desc = "ファイラー トグル" })
keymap("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "ファイラーにフォーカス" })
keymap("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>", { desc = "現在ファイルを探す" })

