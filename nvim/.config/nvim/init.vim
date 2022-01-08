"====
"auto complete install
"====
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"====
"system
"====
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
" Prevent incorrect backgroung rendering
let &t_ut=''
"set the line of end has show



"====
"Editor
"====
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:\|\ ,trail:▫
set foldmethod=syntax
set foldlevel=99
set foldenable
" set cursorline

"====
"main
"====
syntax on
set relativenumber
set wildmenu
set wrap
set showcmd
set hlsearch
set smartcase
set ignorecase

"set clipboard=unnamedplus

"set <LEADER> as <SPACE>
let mapleader=" "

"clear hlsearch
nnoremap <LEADER><CR> :nohlsearch<CR>

"===
"Cursor Move
"===
noremap K 5k
noremap J 5j

"use  jj
"inoremap jj <ESC>

"copy to system clipboard
vnoremap Y "+y


"open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

"open the coc-settings file anytime
noremap <LEADER>rv :e ~/.config/nvim/coc-settings.json<cr>

map S :w<CR>
map Q :q!<CR>
map R :source $MYVIMRC<CR>
map s <nop>
map sl :set nosplitright<CR>:vsplit<CR>
map sr :set splitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sb :set splitbelow<CR>:split<CR>

map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l
noremap L :tabn<CR>
noremap H :tabp<CR>

call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    "Plug 'dracula/vim'
    "Plug 'connorholyday/vim-snazzy'
    Plug 'junegunn/seoul256.vim'
    Plug 'morhetz/gruvbox'

    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'luochen1990/rainbow'
    Plug 'gcmt/wildfire.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
    Plug 'airblade/vim-gitgutter'

    Plug 'honza/vim-snippets'
    Plug 'laishulu/vim-macos-ime'
    Plug 'tmhedberg/SimpylFold'

    Plug 'voldikss/vim-floaterm'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"
""SimpylFold
"
let g:SimpylFold_docstring_preview = 1

"
""vim-macos-ime
"
let g:macosime_cjk_ime= 'com.apple.inputmethod.SCIM.ITABC'
let g:macosime_normal_ime = 'com.apple.keylayout.ABC'
"
""coc.vim
"
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'coc-tsserver',
    \ 'coc-pairs',
    \ 'coc-vimlsp',
    \ 'coc-rust-analyzer',
    \ 'coc-clangd',
    \ 'coc-snippets',
    \ 'coc-explorer',
  \ ]

"
""coc_snippet
"
let g:snips_author="52funny"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"
""vim-go
"
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 0
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

""
"""NERDTree
""
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap tt :NERDTreeToggle<CR>
""nnoremap <C-f> :NERDTreeFind<CR>


"
""coc-yank
"
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"
""rainbow
"
let g:rainbow_active = 1

"
""lazygit_nvim
"
nnoremap <silent> <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

"
""gitgutter
"
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

"
""fzf
"
noremap <silent> <leader>ff :Files<CR>
noremap <silent> <leader>h :History<CR>
noremap <silent> <leader>w :Buffer<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
"let g:fzf_preview_window = 'right:60%'
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"


"
""coc-explore
"
:nnoremap tt :CocCommand explorer<CR>

colo seoul256
set background=dark
" colorscheme gruvbox
"colorscheme dracula

"colorscheme or snazzy
"let g:SnazzyTransparent=1

" Compile function
noremap <leader>rr :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
        exec "FloatermNew --autoclose=0 gcc % -o %< && ./%<"
		" exec "!g++ % -o %<"
		" exec "!./%<"
	elseif &filetype == 'cpp'
		" set splitbelow
        exec "FloatermNew --autoclose=0 g++ -std=c++11 % -Wall -o %< && ./%<"
		" exec "!g++ -std=c++11 % -Wall -o %<"
		" :sp
		" :res -15
		" :term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
        exec "FloatermNew --autoclose=0 python3 %"
		" set splitbelow
		" :sp
		" :term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
        exec "FloatermNew --autoclose=0 go run ."
		" :term go run .
    elseif &filetype == 'rust'
        :RustRun
	endif
endfunc


"
"coc-nvim
"
set hidden
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
  " Recently vim can merge signcolumn and number column into one
"set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>g <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



exec "nohlsearch"
