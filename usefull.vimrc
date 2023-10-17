" USEFULL

" Whitespace TAB mit >~~~ anzeigen
setlocal list
set listchars=tab:>~

" Sprache einstellen
set spelllang=de

" Zeilennummer und relative Zeilennummern
set nu
set rnu

" Welches Terminal
set shell=pwsh

" Kein Zeilenumbruch
set nowrap

" Zeilenumbruch und Backspace
set backspace=indent,eol,start
set whichwrap=<,>,h,l,[,]

" Speichern der aktuellen Suchen, Puffer usw.
set viminfo=%,'50,\"100,:100,n~\\.nviminfo

" Standard-Tabstopgröße und andere Tab-Einstellungen
set tabstop=4
set shiftwidth=4
set expandtab

" Automatisches einrücken zur vorherigen Zeile
set autoindent

" Zeile des Cursor wird markiert
set cursorline

" Cursor-Zeile bei INSERT deaktivieren
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
" Position wird in der Statuszeile angezeigt
set ruler

" Alle gefundenen Treffer werden markiert (entfernen mit :noh)
set hlsearch

" Suffixes die Vim versucht zu öffnen wenn kein Suffix angegeben wurde
set suffixesadd+=.txt
set suffixesadd+=.cs
set suffixesadd+=.json
set suffixesadd+=.xml
set suffixesadd+=.xaml
set suffixesadd+=.html
set suffixesadd+=.css
set suffixesadd+=.py
set suffixesadd+=.psm1

" Pfade angegeben, in denen nach Dateien mit gf und find gesucht wird
"set path+=C:\Users\Admin\OneDrive\Dokumente\WindowsPowerShell\Modules\Path

" ------------------------------------------------------------------------------------------------------------
"                                                REMAPS
" ------------------------------------------------------------------------------------------------------------

" Windows like Strg+Z   für UNDO
map <C-z> u
" Windows like Strg+Y   für REDO
map <C-y> <C-r>
" Alternative: zu       für UNDO
map zu u
" Alternative: zU       für REDO
map zU <C-r>
"        oder: zr       für REDO
map zr <C-r>

" Return für neue Zeile einfügen & insertmodus
noremap <CR> o


let mapleader="ü"
" üüf -> 👉         üüe -> 🏴       üüb -> ⚡
map üüf i<C-V>U1f449<Esc>
map üüe i<C-V>U1f3f4<Esc>
map üüb i<C-V>U26a1<Esc>

" ########## go -> Go OBEN/Top und gu ->Go UNTEN/Bottom
noremap go gg
noremap gu G

" ########## Strg+. wiederholt den letzten Ex-Befehl                                                ##########
map <C-.> @:
" ########## Aktuelle Zeile oder markierten Bereich duplizieren (ohne Register!)                    ##########
map <C-P> :t.<CR>

" ########## Bewegungen: ß -> Zeilenanfang, ä -> 1/2 Seite runter, ö -> 1/2 Seite hoch              ##########
map ß 0^
map ä <C-D>
map ö <C-U>

" ########## _           : ` ersetzen (Springe zur Cursorposition der Marke)                        ##########
map _ `

" ########## _           : ciq, viq, yiq, diq nutzbar machen (aus VSC)                              ##########
nnoremap ciq ci"
nnoremap viq vi"
nnoremap yiq yi"
nnoremap diq di"

" ------------------------------------------------------------------------------------------------------------
"                                            CODING REMAPS
" ------------------------------------------------------------------------------------------------------------
" ########## Strg+7     : Redo (für Visual Studio, da dort Strg+R anders belegt)                    ##########
map <C-7> :redo<CR>

" ########## Umschließungen mit "",'',``,(),[],{},/* */                                             ##########
" String (2, " oder s)
map <Leader>2 c""<Esc>P
map <Leader>" c""<Esc>P
map <Leader>s c""<Esc>P

" Klammer (8, ( oder k)
map <Leader>8 c(  )<Esc>hP
map <Leader>( c(  )<Esc>hP
map <Leader>k c(  )<Esc>hP

" Geschweifte Klammer / Object (9, { oder o)
map <Leader>9 c{  }<Esc>hP
map <Leader>{ c{  }<Esc>hP
map <Leader>o c{  }<Esc>hP

" Eckige Klammer / Array (0 [ oder a)
map <Leader>0 c[  ]<Esc>hP
map <Leader>[ c[  ]<Esc>hP
map <Leader>a c[  ]<Esc>hP

" Anführungszeichen / String (#, ' oder S)
map <Leader># c''<Esc>P
map <Leader>' c''<Esc>P
map <Leader>S c''<Esc>P

" Template-String / Ticks (ß, ` oder t)
map <Leader>ß c``<Esc>P
map <Leader>` c``<Esc>P
map <Leader>t c``<Esc>P

" Kommentar (7, / oder K)
map <Leader>7 c/*  */<Esc>hhP
map <Leader>/ c/*  */<Esc>hhP
map <Leader>K c/*  */<Esc>hhP

" Tag / HTML/XML Tag (<, h oder x)
map <Leader>< c<><Esc>P
map <Leader>x c<><Esc>P
map <Leader>h c<><Esc>P

" Block (b)
map <Leader>b >gvc<Esc>A{<Enter>}<Esc>P
" ------------------------------------------------------------------------------------------------------------
"                                            DEAKTIVIERTE MAPS
" ------------------------------------------------------------------------------------------------------------
" ########## Strg+C und Strg+V für Kopieren/Einfügen                                                ##########
" vnoremap <C-c> "+y
" map <C-v> "+p

" ########## FÜR UBUNTU VIM!                                                                        ##########
" let &t_SI = "\<esc>[5 q"
" let &t_SR = "\<esc>[3 q"
" let &t_EI = "\<esc>[2 q"

" ########## Cursorbewegung umschalten (von jk normale Zeilen zu jk anzeigezeilen);nur bei set wrap ##########
" nnoremap k gk
" nnoremap j gj
" nnoremap gk k
" nnoremap gj j

" ########## Cursortasten unbrauchbar machen (zum erlernen der hjkl-Navigation)                     ##########
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" ########## Entfernentaste als Esc-Taste nutzen                                                    ##########
" nnoremap <Del> <Esc>
" vnoremap <Del> <Esc>gV
" onoremap <Del> <Esc>
" cnoremap <Del> <C-C><Esc>
" inoremap <Del> <Esc>`^
tnoremap <F10> <C-\><C-n>
nnoremap <F10> <C-\><C-n>
vnoremap <F10> <C-\><C-n>
onoremap <F10> <C-\><C-n>
cnoremap <F10> <C-\><C-n>
inoremap <F10> <C-\><C-n>


" Verwende Vim-Plug für die Plugin-Verwaltung
call plug#begin('~/.config/nvim/plugged')
Plug 'wbthomason/packer.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'sitiom/nvim-numbertoggle'
call plug#end()

" gy -> ganze Zeile in die Zwischenablage kopieren, aber ohne CR
nnoremap gy 0v$h"+y


""""" EasyMotion Configuration """""

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Search (2 Chars)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)

" Alternative mit Leader und !
map  <Leader><Leader>/ <Plug>(easymotion-sn)
map  ! <Plug>(easymotion-sn)
omap <Leader><Leader>/ <Plug>(easymotion-tn)
omap ! <Plug>(easymotion-tn)

" Ersatz für Original /-Suche
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  <Leader>n <Plug>(easymotion-next)
map  <Leader>N <Plug>(easymotion-prev)

" hjkl Search
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap <Leader><Leader>s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap <Leader><Leader>t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
" !! Kleinbuchstaben werden angezeigt, aber egal was man drückt, es sind
" Großbuchstaben -> geht nicht !! NIE AUF = 1 ändern:
let g:EasyMotion_use_upper = 0
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

