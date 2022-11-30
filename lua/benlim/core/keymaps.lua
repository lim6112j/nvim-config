vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "df", "<ESC>`^")
keymap.set("i", "jk", "<ESC>`^")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x') -- delete char not copied 

keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>wv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>ws", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- split windows equal width
keymap.set("n", "<leader>wq", ":close<CR>") -- close current window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin kemaps

-- vim maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")
