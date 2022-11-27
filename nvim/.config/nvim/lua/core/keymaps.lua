function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader
vim.g.mapleader = ' '

-- main
vim.keymap.set('', 'S', ':w<cr>', {})
vim.keymap.set('', 'Q', ':q!<cr>', {})
vim.keymap.set('', 's', '<nop>', {})
-- map('', 'R', ':source $MYVIMRC<cr>', {})
map('', 'R', ':source $MYVIMRC<cr>', {})

map('n', '<leader><cr>', ':nohlsearch<cr>', {})

-- direction
map('n', 'K', '5k', {})
map('n', 'J', '5j', {})
vim.keymap.set({ 'n', 'v' }, 'H', '^', {})
vim.keymap.set({ 'n', 'v' }, 'L', '$', {})

-- clipboard
map('v', 'Y', '"+y', {})


--NvimTree
map('n', 'tt', ':NvimTreeToggle<CR>')
map('n', '<leader>f', ':NvimTreeRefresh<CR>')
map('n', '<leader>n', ':NvimTreeFindFile<CR>')


--Lazygit.nvim
map('n', '<leader>lg', ':LazyGit<cr>')
