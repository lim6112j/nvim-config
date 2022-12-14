require("benlim.plugins-setup")
require("benlim.core.options")
require("benlim.core.keymaps")
require("benlim.core.colorscheme")
require("benlim.plugins.comment")
require("benlim.plugins.nvim-tree")
require("benlim.plugins.lualine")
require("benlim.plugins.telescope")
require("benlim.plugins.nvim-cmp")
require("benlim.plugins.lsp.mason")
require("benlim.plugins.lsp.lspsaga")
require("benlim.plugins.lsp.lspconfig")
require("benlim.plugins.lsp.null-ls")
require("benlim.plugins.autopairs")
require("benlim.plugins.treesitter")
require("benlim.plugins.gitsigns")
require("benlim.plugins.neogit")
vim.fn["plug#begin"](vim.fn.stdpath("data") .. "/plugged")
vim.fn["plug#"]("ionide/Ionide-vim")
vim.fn["plug#end"]()
