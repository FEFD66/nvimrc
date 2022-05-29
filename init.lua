require 'basic'
require 'plugins'

require 'lsp'
require 'plugin-config'
require 'dap-config'

vim.cmd [[ try | colorscheme gruvbox| catch /^Vim\%((\a\+)\)\=:E185/|
  echo "Fallback default colorscheme"|colorscheme default| set background=dark
endtry ]]
