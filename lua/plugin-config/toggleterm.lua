require'toggleterm'.setup {
  direction = 'float',
  open_mapping = [[<C-\>]],
  float_opts = {
    border = 'curved'
  }
}
local opts = { noremap=true,silent=true}
local keymap=vim.api.nvim_set_keymap
keymap("n","<C-Bslash>",'<Cmd>exe v:count1 . "ToggleTerm"<CR>',opts)

vim.cmd [[
autocmd TermEnter term://*toggleterm#*
    \tnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]]
