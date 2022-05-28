require 'basic'
require 'plugins'

require 'plugin-config'
require 'lsp'

vim.cmd [[ try | colorscheme darkplus| catch /^Vim\%((\a\+)\)\=:E185/|
  echo "Fallback default colorscheme"|colorscheme default| set background=dark
endtry ]]
