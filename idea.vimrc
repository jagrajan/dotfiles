set surround
set commentary

set relativenumber
set number
let mapleader = " "
map ; :

nnoremap gw :write<cr>
nnoremap gq :quit<cr>
nnoremap gQ :quitall<cr>
inoremap <c-n> <down>
inoremap <c-p> <up>
xnoremap p pgvy

""" Config ------------------------------------------------
nnoremap <leader>ve :edit ~/.ideavimrc<CR>
nnoremap <leader>vs :actionlist<space>
nnoremap <leader>vr :source ~/.ideavimrc<CR>

""" Navigation --------------------------------------------
nnoremap <leader>fa :action GotoAction<CR>
nnoremap <leader>fe :action SearchEverywhere<CR>
nnoremap <leader>ff :action GotoFile<CR>
nnoremap <leader>fn :action ShowNavBar<CR>
nnoremap <leader>fr :action RecentFiles<CR>
nnoremap <leader>fs :action GotoSymbol<CR>
nnoremap gr :action FindUsages<CR>
nnoremap - :action SelectInProjectView<CR>
nnoremap / :action Find<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

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
map <leader>hu :action Vcs.RollbackChangedLines<CR>
nnoremap [c :action VcsShowPrevChangeMarker<cr>
nnoremap ]c :action VcsShowNextChangeMarker<cr>

""" Splits ------------------------------------------------
map <leader>wq :action CloseAllEditors<CR>
map <leader>ww :action CloseActiveTab<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

""" Editing -----------------------------------------------
nnoremap <leader>ee :action Javascript.Linters.EsLint.Fix<CR>
nnoremap <leader>ef :action Refactorings.QuickListPopupActionCR>
nnoremap <leader>eh :action MoveElementLeft<CR>
nnoremap <leader>ei :action ShowIntentionActions<CR>
nnoremap <leader>el :action MoveElementRight<CR>
nnoremap <leader>ep :action ReformatWithPrettierAction<CR>
nnoremap <leader>er :action ReformatCode<CR>

""" Open --------------------------------------------------
nnoremap <leader>od :action ActivateDatabaseToolWindow<CR>
nnoremap <leader>on :action ActivatenpmToolWindow<CR>
nnoremap <leader>op :action ActivateProjectToolWindow<CR>
nnoremap <leader>or :action ActivateRunToolWindow<CR>
nnoremap <leader>os :action FileStructurePopup<CR>
nnoremap <leader>ot :action ActivateTerminalToolWindow<CR>
nnoremap <leader>oj :action ActivateTeamCityToolWindow<CR>
nnoremap <leader>oc :action ActivatePullRequestsToolWindow<CR>

