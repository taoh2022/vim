    set fileformat=unix
"   set nocp    
    "Turn off the beep sounds
    set vb
    set nocompatible        " Use Vim defaults (much better!)
    set bs=2                " allow backspacing over everything in insert mode
"    set ai                  " always set autoindenting on
    set backup              " keep a backup file
    set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                            " than 50 lines of registers
    set shell=/bin/bash
    set softtabstop=4
    set cindent shiftwidth=4
    set tabstop=4
    set expandtab
    set shiftwidth=4 

"    set lines=49
"    set co=160
set autochdir
set path+=$PROD_PATH/bin/scripts
set path+=$FUSION_FPGASRC/*
set path+=$FUSION_FPGASRC/*/*
set path+=$FUSION_FPGASRC/*/*/*
set path+=$FUSION_FPGASRC/*/*/*/*
set path+=$PROD_PATH/tb/*
set path+=$PROD_PATH/tb/*/*
set path+=$PROD_PATH/tb/*/*/*
set path+=$PROD_PATH/tb/*/*/*/*
set path+=$PROD_PATH/fpga/mc/doc/regmodel   
set path+=$PROD_PATH/fpga/bf/doc/regmodel
" syntax highlighting when the terminal has colors or there is a gui
    if (&t_Co > 2 || has("gui_running")) && has("syntax")    
        syntax on
    endif
    if has("gui_running")
        "set guioptions-=T "Remove toolbar
        set guioptions-=L "Remove Left Scrollbar
        set guioptions-=r "Remove Right Scrollbar
        set guioptions-=b "Remove Botton bar
        "set guioptions-=m "Remove menu bar 
        set guioptions+=b 
        set guifont=Monospace\ 9 
    endif

" for EnhancedCommentify
    let g:EnhCommentifyTraditionalMode = 'no'       " yes: check for every line what should be done
    let g:EnhCommentifyFirstLineMode = 'yes'        " yes: use first line to check what to do; no effect when TraditionalMode is on
    let g:EnhCommentifyUseAltKeys = 'no'
    let g:EnhCommentifyRespectIndent = 'yes'        " yes: indent /*
    let g:EnhCommentifyPretty = 'yes'               " yes: /* comment */ instead of /*comment*/
    let g:EnhCommentifyMultiPartBlocks = 'yes'      " yes: use /* */ instead of //

    set noru ru
    set nohls hls
    set incsearch 
"" searches don't wrap around end of file
    "set nowrapscan   
"set smartcase 
set sessionoptions+=resize

" fix backspace from linux
map!  <BS>
"--------------------------------------------------------------"
"Automaticaly cd to directory of the buffer. 
"--------------------------------------------------------------"

"--------------------------------------------------------------"
"tab completion behaves more like in emacs or zsh, press CTRL-D
"--------------------------------------------------------------"
set wildmode=longest

"--------------------------------------------------------------"
"set ignorecase "ignore case of search if pattern is lower-case
"--------------------------------------------------------------"
set nowrap "disable line wrap for long files
"set textwidth=72 "supplement ot line wrap annoyance
set uc=0  "No swap file will be used
"set number "display line numbers in editor
"set nonumber "disable display line numbers in editor
" In text files, always limit the width of text to 78 characters
" autocmd BufRead *.txt set tw=100 
"set guifont=console8x13bold\ 9
"set guifont= courier:s12:b
let &termencoding=&encoding
set encoding=utf-8
"set guifont=-misc-fixed-medium-r-normal--18-120-100-c-90-iso10646-1
" calculator
if has("python")
    command! -nargs=+ Calc :py print <args>
    py from cmath import *
end

map Q gq
" useful stuff from emacs
    imap <C-b> <Left>
    imap <C-f> <Right>
    imap <C-a> <Home>
    imap <C-e> <End>

    imap <C-M>ia <TAB>always @ (posedge clk) begin<CR><TAB>if(rst) begin<CR><CR>end //if<CR>else begin<CR><CR>end//else<CR><HOME><Tab>end//always<CR>
    imap <C-M>aa (others => '1')
    imap <C-M>ab '0'            
    imap <C-M>ac (others => '1')
    imap <C-M>ad '1'            
    imap <C-M>ae  <= (others => '0');
    imap <C-M>af  <= '0'            ;
    imap <C-M>ag  <=  
    imap <C-M>ba : std_logic                    ; --
    imap <C-M>bb : std_logic_vector(10 downto 0); -- 
    imap <C-M>bc : in  std_logic                    ; --
    imap <C-M>bd : out std_logic                    ; -- 
    imap <C-M>be : in  std_logic_vector(10 downto 0); -- 
    imap <C-M>bf : out std_logic_vector(10 downto 0); -- 
    imap <C-M>bg : out std_logic_vector(10 downto 0); -- 
    imap <C-M>ca signal Xsingal_name            : std_logic_vector(17 downto 0) ; -- 
    imap <C-M>cb signal Xsingal_name            : std_logic                     ; -- 
    imap <C-E>e <Esc>bdwientity <Esc>pa is<CR>end entity ;<Esc>POport (<CR>);<Esc>O
    imap <C-E>a <Esc>b"zdwiarchitecture <Esc>pa of <Esc>mz?entity<CR>wyw`zpa is<CR>begin<CR>end architecture ;<Esc>"zPO
    imap <C-E>p <Esc>bywA : process ()<CR>begin<CR>end process ;<Esc>PO<+process body+><Esc>?)<CR>i
    imap <C-E>g <Esc>bdwipackage <Esc>pa is<CR><BS>end package ;<Esc>PO    
    imap <C-E>c case  is<CR>when <+state1+> =><CR><+action1+><CR>when <+state2+> =><CR><+action2+><CR>when others => null;<CR>end case;<Esc>6k$2hi
    imap <C-E>i if  then<CR><+do_something+>;<CR>elsif <+condition2+> then<CR><+do_something_else+>;<CR>else<CR><+do_something_else+>;<CR>end if;<Esc>6k$4hi
    " shortcuts
    "imap ,, <= 
    "imap .. => 
    """For VHDL Commmenting
    vmap ,s : s/^/ / <CR>
    vmap ,c : s/^/\/\// <CR>
    vmap ,v : s/^/#/ <CR>
    vmap ,d : s/\/\/ /  / <CR> 
    vmap ,o : s/$/ \/\/[OUT]/ <CR>
    vmap ,i : s/$/ \/\/[IN]/ <CR>
    vmap ,m : s/$/=> ,/ <CR>

    imap <buffer> <C-s>i <Esc>:VHDLinst 
    imap <buffer> <C-s>c <Esc>:VHDLcomp
    " alt key mappings
    imap <buffer> <M-i> <Esc>owhen 
    " abbreviations
    iabbr lo  logic
    "iabbr r  reg
    " iabbr w  wire
    iabbr dt downto
    iabbr sig signal
    iabbr gen generate
    iabbr ot others
    iabbr sl std_logic
    iabbr slv std_logic_vector
    iabbr uns unsigned
    iabbr toi to_integer
    iabbr tos to_unsigned
    iabbr tou to_unsigned
    imap  I: I : in 
    imap  O: O : out 

let g:vimsh_sh              = "/bin/ksh"
map <C-Z> :vimshell bash <CR> pwd <CR>
"map <C-X> :VimShNewBuf vimsh
"source ~/.vim/vimsh.vim
"source ~/shell.vim
"so $HOME/$PRODUCT.vimrc

if has("gui_running")
    "colors fog
    colors blacksea 
else
    "colors fog
    colors desert 
endif
"set background=light
"    colors blackbeauty 
"    colors habilight
"   colors desert256
"    colors torte 
"    colors delek
" colors ron
"colors torte
"colors desert256
"colors settlemyer
"colors spring
"colors peaksea
"colors winter
"colors leo
"colors manxome
"colors motus
"colors morning
colors deepblue

colors desert 
cmap Fi find
command! -complete=shellcmd -nargs=+ Sh call s:RunShellCommand(<q-args>)
command! -complete=file -nargs=* Svn call s:RunShellCommand('svn '.<q-args>)
command! -complete=file -nargs=* Bzr call s:RunShellCommand('bzr '.<q-args>)
command! -complete=file -nargs=* Hg  call s:RunShellCommand('hg '.<q-args>)
filetype plugin indent on

function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
       let expanded_part = fnameescape(expand(part))
       let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
   endfor
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
   call setline(1, 'You entered:    ' . a:cmdline)
   call setline(2, 'Expanded Form:  ' .expanded_cmdline)
   call setline(3,substitute(getline(2),'.','=','g'))
   execute '$read !'. expanded_cmdline
   setlocal nomodifiable
   1
endfunction

""function FT_vhdl()
"    if exists("+omnifunc")
"        setlocal omnifunc=syntaxcomplete#Complete
"    endif
"    " for taglist
"    let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
"    " command mappings for perl scripts
"    command! -nargs=1 -complete=file VHDLcomp r! ~/.vim/vhdl/vhdl_comp.pl <args>
"    command! -nargs=1 -complete=file VHDLinst r! ~/.vim/vhdl/vhdl_inst.pl <args>
"    " environments
"    " emacs vhdl mode
"    " warning: the following is dangerous, becase the file is written and then opened again, which means, the undo history is lost; if someting goes wrong, you may loose your file
"    command! EVMUpdateSensitivityList :w|:execute "!emacs --no-init-file --no-site-file -l ~/.vhdl/vhdl-mode.el -batch % --eval '(vhdl-update-sensitivity-list-buffer)' -f save-buffer" | :e
"    map <F12> :EVMUpdateSensitivityList<CR>
""endfunction




