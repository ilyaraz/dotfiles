call pathogen#infect()

set autoindent
set number
set cindent
set expandtab
set tabstop=4
retab
set shiftwidth=4
syntax on
set visualbell
set t_vb=

set wildmenu
set wcm=<Tab>

imap <F2> <Esc>:tabprevious<CR>i
nmap <F2> :tabprevious<CR>
imap <F3> <Esc>:tabnext<CR>i
nmap <F3> :tabnext<CR>
imap <C-o> <Esc>:tabnew<Space>
nmap <C-o> :tabnew<Space>

function MyTabLine()
    let tabline = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let tabline .= '%#TabLineSel#'
        else
            let tabline .= '%#TabLine#'
        endif

        let tabline .= '%' . (i + 1) . 'T'

        let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
    endfor

    let tabline .= '%#TabLineFill#%T'

    if tabpagenr('$') > 1
        let tabline .= '%=%#TabLine#%999XX'
    endif

    return tabline
endfunction

function MyTabLabel(n)
    let label = ''
    let buflist = tabpagebuflist(a:n)

    let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

    if label == ''
      let label = '[No Name]'
    endif

    let label .= ' (' . a:n . ')'

    for i in range(len(buflist))
        if getbufvar(buflist[i], "&modified")
            let label = '[+] ' . label
            break
        endif
    endfor

    return label
endfunction

set makeprg=make\ -j4
nmap <C-b> :w<CR>:make<CR><CR><CR>:cw<CR>:cc<CR>
nmap <C-n> :cn<CR>:cc<CR> 
nmap <C-p> :cp<CR>:cc<CR>

nmap <C-e> :Explore<CR>

map <Space> <C-d>
map <BS> <C-u>

inoremap {<CR>  {<CR>}<Esc>O

set nocp      
filetype plugin indent on 
set backspace=2
