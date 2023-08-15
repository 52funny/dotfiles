-- keymap
vim.keymap.set('n', 'S', ':w<cr>')
vim.keymap.set('n', 'Q', ':q!<cr>')
-- vim.keymap.set('n', 'R', ':so<cr>')

vim.keymap.set({ 'n', 'v' }, 'J', '5j')
vim.keymap.set({ 'n', 'v' }, 'K', '5k')

vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', 'g_')

vim.keymap.set('v', 'Y', '"+y')

vim.keymap.set({ 'n', 'v' }, 's', '<nop>')

vim.keymap.set('n', '<leader><cr>', ':nohlsearch<cr>')

vim.keymap.set({ 'n' }, 'sl', ':set nosplitright<cr>:vsplit<cr>')
vim.keymap.set({ 'n' }, 'sr', ':set splitright<cr>:vsplit<cr>')
vim.keymap.set({ 'n' }, 'su', ':set nosplitbelow<cr>:split<cr>')
vim.keymap.set({ 'n' }, 'sb', ':set splitbelow<cr>:split<cr>')

-- better tab movement
vim.keymap.set({ 'n', 'v' }, '<Tab>', ':tabnext<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', ':tabprevious<cr>', { noremap = true, silent = true })


vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 'v' }, '<c-j>', '<c-w>j')
vim.keymap.set({ 'n', 'v' }, '<c-h>', '<c-w>h')
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w>l')

vim.keymap.set({ 't' }, '<Esc>', '<C-\\><C-n>')

-- vim.keymap.set({ 'n' }, '<leader>r', ':luafile $MYVIMRC<CR>', { noremap = true, silent = true })

-- vim.keymap.set({ 'n', 'v' }, 'H', ":tabprevious<cr>")
-- vim.keymap.set({ 'n', 'v' }, 'L', ":tabnext<cr>")

-- -- lazygit
-- vim.keymap.set('n', '<leader>lg', ':LazyGit<cr>', { noremap = true })

-- lsp error float windows
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
    { silent = true, noremap = true })

-- format
vim.keymap.set('n', "F", ":Format<CR>", { silent = true, noremap = true })
