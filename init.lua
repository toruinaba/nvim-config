vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
]])
require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.lsp")
