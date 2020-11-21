set surround
set commentary

set relativenumber
set number
let mapleader = " "
map ; :

nnoremap gw :write<cr>
nnoremap gq :quit<cr>
nnoremap gQ :quitall<cr>

""" Config ------------------------------------------------
map <leader>ve :edit ~/.ideavimrc<CR>
map <leader>vs :actionlist<space>

""" Navigation --------------------------------------------
map <leader>fa :action GotoAction<CR>
map <leader>fe :action SearchEverywhere<CR>
map <leader>ff :action GotoFile<CR>
map <leader>fn :action ShowNavBar<CR>
map <leader>fr :action RecentFiles<CR>
map <leader>fs :action GotoSymbol<CR>
map gr :action FindUsages<CR>

""" Debug --------a----------------------------------------
map <leader>db :action ToggleLineBreakpoint<CR>
map <leader>dc :action DebugClass<CR>
nnoremap [d :action GotoPreviousError<CR>
nnoremap ]d :action GotoNextError<CR>

""" Run ---------------------------------------------------
map <leader>rm :action ChooseRunConfiguration<CR>
map <leader>rc :action RunClass<CR>

""" Git ---------------------------------------------------
map <leader>ga :action Annotate<CR>
map <leader>gb :action Git.Branches<CR>
map <leader>gc :action ChangesView.ToggleCommitUi<CR>
map <leader>gg :action Vcs.Show.Local.Changes<CR>
map <leader>gh :action Vcs.ShowTabbedFileHistory<CR>
map <leader>gl :action Vcs.Show.Log<CR>
map <leader>gm :action Github.Create.Pull.Request<CR>
map <leader>go :action Github.Open.In.Browser<CR>
map <leader>gp :action Vcs.Push<CR>
map <leader>gr :action Github.View.Pull.Request<CR>
map <leader>gs :action ChangesView.Shelve<CR>
map <leader>gu :action Vcs.UpdateProject<CR>

""" Splits ------------------------------------------------
map <leader>wq :action CloseEditorsGroup<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

""" Editing -----------------------------------------------
map <leader>ee :action Javascript.Linters.EsLint.Fix<CR>
map <leader>ef :action Refactorings.QuickListPopupActionCR>
map <leader>eh :action MoveElementLeft<CR>
map <leader>ei :action ShowIntentionActions<CR>
map <leader>el :action MoveElementRight<CR>
map <leader>ep :action ReformatWithPrettierAction<CR>
map <leader>er :action ReformatCode<CR>

""" Open --------------------------------------------------
map <leader>od :action ActivateDebugToolWindow<CR>
map <leader>on :action ActivatenpmToolWindow<CR>
map <leader>op :action ActivateProjectToolWindow<CR>
map <leader>or :action ActivateRunToolWindow<CR>
map <leader>ot :action ActivateTerminalToolWindow<CR>

