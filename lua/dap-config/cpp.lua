local dap = require'dap'
dap.adapters.lldb= {
  name = 'lldb',
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type ="lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'lldb',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = {
  {
    name = "Launch Debug",
    type ="lldb",
    request = "launch",
    program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
