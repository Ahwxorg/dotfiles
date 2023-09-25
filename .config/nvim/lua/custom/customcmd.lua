local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local del_augroup = vim.api.nvim_del_augroup_by_name

local settings = require("custom.chadrc").custom

 -- Open GitHub repository
create_cmd("OpenRepo", function()
  local currentline = vim.fn.getline "."
  local reponame = vim.fn.matchstr(currentline, '".*"')
  local url = "https://github.com/" .. reponame

  vim.cmd("silent !open -n chromium" .. url)
end, {})
