-- 加载cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.setup {
  sources = cmp.config.sources({
    { name = 'nvim_lsp'},
    { name = 'buffer'},
    { name = 'vsnip'},
    { name = 'path'},
  }),
  mapping = {
    ["<CR>"] = cmp.mapping.confirm{select = false},
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else 
        fallback()
      end
    end,{"i","s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else 
        fallback()
      end
    end,{"i","s"})
  }
}
cmp.setup.cmdline('/',{
  mapping = cmp.mapping.preset.cmdline(),
  sources = {{name='buffer'}}
})
cmp.setup.cmdline(':',{
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources{{name='path'},{name='cmdline'}}
})
