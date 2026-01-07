vim.keymap.set('n', 'S', ':w<cr>')
vim.keymap.set('n', 'Q', ':q!<cr>')

vim.keymap.set('n', 'R', ':source $MYVIMRC<cr>')

vim.keymap.set({ 'n', 'v' }, 'J', '5j')
vim.keymap.set({ 'n', 'v' }, 'K', '5k')

vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', 'g_')

vim.keymap.set('n', '<leader><cr>', ':nohlsearch<cr>')
