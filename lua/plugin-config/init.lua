local _PACKAGE = 'plugin-config'
print 'Plugin-config loading'

local packages={
  "cmp",
  "nvimtree",
  "autopairs",
  "lualine",
  "bufferline",
}
for _,pack in ipairs(packages) do
  -- print(_PACKAGE .. '.'..pack)
  require (_PACKAGE .. '.'..pack)
end
-- TODO: Doesn't work
--require('Comment').setup{}
