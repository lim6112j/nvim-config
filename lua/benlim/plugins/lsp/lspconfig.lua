local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable  autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
-- clang
lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- rust-analyzer
lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- fsharp
lspconfig["fsautocomplete"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- haskell-language-server
lspconfig["hls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- csharp-language-server
lspconfig["csharp_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- elixir language server
lspconfig["elixirls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- clojure language server
lspconfig["clojure_lsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- kotlin language server
lspconfig["kotlin_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- HTML language server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- zls , zig language server
lspconfig["zls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- java
lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- python

lspconfig["pylsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- elm

lspconfig["elmls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- rust tools
local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- hover action
			vim.keymap.set("n", "C-space", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

-- LSP Diagnostics Options Setup
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
