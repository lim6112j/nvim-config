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
vim.fn["plug#"]("vim-scripts/paredit.vim")
vim.fn["plug#end"]()
vim.api.nvim_command("set nofoldenable")
-- Load custom treesitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
	-- If TS highlights are not enabled at all, or disabled via `disable` prop,
	-- highlighting will fallback to default Vim syntax highlighting
	highlight = {
		enable = true,
		-- Required for spellcheck, some LaTex highlights and
		-- code block highlights that do not have ts grammar
		additional_vim_regex_highlighting = { "org" },
	},
	ensure_installed = { "org" }, -- Or run :TSUpdate org
})
