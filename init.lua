vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.lsp")
