local _PACKAGE = 'plugin-config'
print 'Plugin-config loading'

local basic_packages={
  "nvimtree",
  "autopairs",
  "lualine",
  "bufferline",
  "whichkey",
  "comment",
  "treesitter",
  "toggleterm",
  "colorscheme",
  "trouble",
}
local no_tabnine={
  "cmp"
}
local with_tabnine= {
  "cmp-tn",
  "tabnine"
}
local function load_pkgs(packages)
  for _,pack in ipairs(packages) do
    -- print(_PACKAGE .. '.'..pack)
    require (_PACKAGE .. '.'..pack)
  end
end
local M ={}
M.setup = function (enableTabnine)
  load_pkgs(basic_packages)
  if enableTabnine then
    print("TabNine Enabled")
    load_pkgs(with_tabnine)
  else
    load_pkgs(no_tabnine)
    print("TabNine Disabled")
  end
end
return M
-- TODO: Doesn't work
--require('Comment').setup{}
