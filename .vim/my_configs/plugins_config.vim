"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note:
"       Adapted from https://github.com/amix/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ ['mode', 'paste', 'readonly'],
      \             ['branchname'], 
      \             ['filename', 'modified'] ],
      \   'right': [ ['reponame'], ['lineinfo'], ['percent'], ['zoomed'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ },
      \ 'component_function': {
      \   'zoomed': 'zoom#statusline',
      \   'branchname': 'fugitive#head',
      \   'reponame': 'RepoName',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head()") && ""!=fugitive#head())',
      \   'reponame': '(exists("*fugitive#repo()") && ""!=fugitive#repo())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }
function! RepoName()
    try
        return fnamemodify(fugitive#repo()["tree"](),":t")
    catch
        return 'no git repo'
    endtry
endfunction
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-T/CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map tt <Plug>(CommandT)
" map tf :CommandTFlush<CR>
" map tb <Plug>(CommandTBuffer)
" let g:CommandTScanDotDirectories=1
" let g:CommandTAcceptSelectionSplitMap='<C-f>'
map tt :CtrlP<CR>
map tf :CtrlPClearCache<CR>
map tb :CtrlPBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_persistence = 1
" let g:startify_session_before_save = [
"     \ 'echo "Cleaning up before saving.."',
"     \ 'echo "Disabling Goyo..."',
"     \ 'Goyo!',
"     \ 'echo "Goyo disabled!"',
"     \ ]
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']        },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
    \ { 'type': 'commands',  'header': ['   Commands']        }
    \ ]
nnoremap <leader>so :SLoad<Space>
nnoremap <leader>ss :SSave<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <Leader>a :Ack! <cword><Space>
map <Leader>a :Ack! <cword><Space>
map <leader>g :Ack!<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Any-Jump
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:any_jump_ignored_files = ['*.tmp', '*.temp', '*csv', '*tsv', '*.txt', '*.log', 'tags']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
    set diffopt-=internal
    set diffopt+=vertical
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>z :Goyo<cr>
let g:goyo_width=120
autocmd VimLeavePre * Goyo!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Flake8-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:PyFlakeCheckers = 'flake8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sneak.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1
let g:sneak#s_next = 1
