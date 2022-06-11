--local ok,dap=pcall(require,"dap")
--if not ok then
--print("dap cannot load")
--  return
--end
local dap = require'dap'
local json=require('plenary.json')
local function load_config(path)
  local file=io.open(path,"r");
  if file == nil then
    print("Failed to open file")
    return
  end
  local str=file:read("*a");
  str = json.json_strip_comments(str,nil)
  local config=vim.json.decode(str)['configurations']
  return config
end
local M={}
function M.setup(opts)
  local path = "/home/kyanc/ws/rust-practise/chatroom/.vscode/launch.json"
  local config = load_config(path)
  dap.configurations.rust=config
end

M.setup(nil)
return {}

