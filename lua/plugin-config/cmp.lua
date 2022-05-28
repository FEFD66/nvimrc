-- 加载cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
local function replace_keys(str)
  return vim.api.nvim_replace_termcodes(str,true,true,true)
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
   --  documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp'},
    { name = 'buffer'},
    { name = 'vsnip'},
    { name = 'path'},
  }),
  mapping = {
    ["<CR>"] = cmp.mapping.confirm{select = false},
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.call('vsnip#available',1) ~=0 then
        vim.fn.feedkeys(replace_keys('<Plug>(vsnip-jump-next)'),'')
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,{"i","s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.call('vsnip#available',-1) ~=0 then
        vim.fn.feedkeys(replace_keys('<Plug>(vsnip-jump-prev)'),'')
      elseif cmp.visible() then
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
return cmp
