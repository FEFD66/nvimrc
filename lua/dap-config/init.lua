local _PACKAGE = 'dap-config'

local configs={
  "cpp",
  "nlua",
  "python"
}
for _,conf in ipairs(configs) do
  require (_PACKAGE .. '.'..conf)
end

local opts = { noremap=true,silent=true}
local keymap = vim.api.nvim_set_keymap

keymap("n","<F8>","<Cmd>:lua require'dap'.toggle_breakpoint()<CR>",opts)
keymap("n","<F5>","<Cmd>:lua require'dap'.continue()<CR>",opts)
keymap("n","<F6>","<Cmd>:lua require'dap'.step_into()<CR>",opts)
keymap("n","<F7>","<Cmd>:lua require'dap'.step_over()<CR>",opts)

require'dapui'.setup {}
