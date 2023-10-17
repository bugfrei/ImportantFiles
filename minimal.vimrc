" MINIMAL

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
