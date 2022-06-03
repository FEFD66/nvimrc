local _PACKAGE = 'dap-config'

local configs={
  "cpp",
  "nlua",
  "python"
}
for _,conf in ipairs(configs) do
  require (_PACKAGE .. '.'..conf)
end

require'dapui'.setup {}
