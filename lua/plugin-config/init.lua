local _PACKAGE = 'plugin-config'
print 'Plugin-config loading'

require (_PACKAGE .. '.cmp')

require (_PACKAGE .. '.nvimtree')
require (_PACKAGE .. '.autopairs')
-- TODO: Doesn't work
--require('Comment').setup{}
