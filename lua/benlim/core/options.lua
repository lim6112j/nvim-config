local opt = vim.opt -- for conciseness
-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
vim.api.nvim_command("hi CursorLine cterm=none ctermfg=white ctermbg=darkred guifg=white guibg=darkred")

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- updatetime: set updatetime for cursorholld
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.shortmess = opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

-- vimspector
vim.cmd([[
  let g:vimspector_sidebar_width = 85
  let g:vimspector_bottombar_height = 15
  let g:vimspector_terminal_maxwidth = 70
  ]])
