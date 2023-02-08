set relativenumber
set guifont=MesloLGS_NF/h19
set noexpandtab
set tabstop=4
set shiftwidth=4
set splitbelow
set incsearch  " Enable incremental search
set incsearch  " Enable incremental search
set splitbelow splitright
set updatetime=100
set linebreak
set timeoutlen=200
set autowriteall
set autoread
:au FocusLost * :w
autocmd BufLeave * update
packloadall
inoremap <S-Tab> <C-d>
nmap df F(hdiwlds)
nmap cf F(hdiwlds)ysiwf
noremap <silent> <C-Up> :resize +3<CR> 
noremap <silent> <C-Down> :resize -3<CR> 
noremap <silent> <C-Right> :vertical resize -3<CR> 
noremap <silent> <C-Left> :vertical resize +3<CR> 
"map  <C-y> :!xclip -f -sel clip<CR>
noremap <leader>tt :vert term<CR>
noremap <leader>th <C-w>t<C-w>K
noremap <leader>tv <C-w>t<C-w>H
noremap <leader>vv :Vifm<CR>
nmap <F8> :TagbarToggle<CR>
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let g:move_key_modifier = 'C'
let b:current_syntax = "dracula"
"let g:dracula_italic=0
let g:tagalong_filetypes = ['html']
let g:user_emmet_leader_key=','
let g:coc_global_extensions = ['coc-css', 'coc-json', 'coc-git', 'coc-html']
let g:indentLine_enabled = 1
" .vimrc
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim'
"Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'https://github.com/AndrewRadev/tagalong.vim.git'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplcache.vim'
Plug 'chrisbra/matchit'
Plug 'NLKNguyen/copy-cut-paste.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'sjl/vitality.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc-html'
call plug#end()
:au FocusLost * :w
set t_Co=256
packadd! dracula 
"colorscheme dracula 
colorscheme dracula 
" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
syntax on
set encoding=utf-8
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <silent><expr> <c-@> coc#refresh()
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Applying code actions to the selected code block.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for apply code actions at the cursor position.
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer.
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for apply refactor code actions.
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

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


" autocomplete pathes
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Enable heavy features.
"" Use camel case completion.
""let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
""let g:neocomplcache_enable_underbar_completion = 1
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
	"    \ 'default' : '',
	"        \ 'vimshell' : $HOME.'/.vimshell_hist',
	"            \ 'scheme' : $HOME.'/.gosh_completions'
	"                    \ }
	"
	"                    " Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
		    let g:neocomplcache_keyword_patterns = {}
		endif
		let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
		
		" Plugin key-mappings.
		" inoremap <expr><C-g>     neocomplcache#undo_completion()
		" inoremap <expr><C-l>     neocomplcache#complete_common_string()
		"
		"" Recommended key-mappings.
		"" <CR>: close popup and save indent.
		"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		"function! s:my_cr_function()
		"  return neocomplcache#smart_close_popup() . "\<CR>"
		  " For no inserting <CR> key.
		  "   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
	  "endfunction
	  " <TAB>: completion.
	  " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	  " " <C-h>, <BS>: close popup and delete backword char.
	  " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	  " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	  " inoremap <expr><C-y>  neocomplcache#close_popup()
	  " inoremap <expr><C-e>  neocomplcache#cancel_popup()
	  " " Close popup by <Space>.
	  " "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() :
	  " "\<Space>"
	  "
	  " " For cursor moving in insert mode(Not recommended)
	  " "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
	  " "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
	  " "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
	  " "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
	  " "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
	  " "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
	  " " Or set this.
	  " "let g:neocomplcache_enable_cursor_hold_i = 1
	  " " Or set this.
	  " "let g:neocomplcache_enable_insert_char_pre = 1
	  "
	  " " AutoComplPop like behavior.
	  " "let g:neocomplcache_enable_auto_select = 1
	  "
	  " " Shell like behavior(not recommended).
	  " "set completeopt+=longest
	  " "let g:neocomplcache_enable_auto_select = 1
	  " "let g:neocomplcache_disable_auto_complete = 1
	  " "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	  "
	  " " Enable omni completion.
	  " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	  " autocmd FileType htmarkdown setlocal
	  " omnifunc=htmlcomplete#CompleteTags
	  " autocmd FileType javascript setlocal
	  " omnifunc=javascriptcomplete#CompleteJS
	  " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	  " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	  "
	  " " Enable heavy omni completion.
	  " if !exists('g:neocomplcache_force_omni_patterns')
	  "   let g:neocomplcache_force_omni_patterns = {}
	  "   endif
	  "   let g:neocomplcache_force_omni_patterns.php = '[^.
	  "   \t]->\h\w*\|\h\w*::'
	  "   let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:]
	  "   *\t]\%(\.\|->\)'
	  "   let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:]
	  "   *\t]\%(\.\|->\)\|\h\w*::'
	  "
	  "   " For perlomni.vim setting.
	  " https://github.com/c9s/perlomni.vim
	  " let g:neocomplcache_force_omni_patterns.perl =
	  " '\h\w*->\h\w*\|\h\w*::'"
	  "   ')'
	  "   ')'"l"
	  " "
	  " "
	  " "
	  " "
	  " "
		  "
		" "
	"}"
""

" Use your keymap
" " Use your keyma
"
	nmap yy <Plug>CCP_CopyLine
	vmap y <Plug>CCP_CopyText

"new config
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
  "
