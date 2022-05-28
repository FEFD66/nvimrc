
local opts = { noremap=true,silent=true}
local keymap = vim.api.nvim_set_keymap

keymap("n","<C-n>","<Cmd>NvimTreeToggle<CR>",opts)

require'nvim-tree'.setup {
}

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
