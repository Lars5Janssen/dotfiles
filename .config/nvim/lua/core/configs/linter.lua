require('lint').linters_by_ft = {
  markdown = {'vale',},
  java = {
    --'checkstyle', 
    'typos', 'trivy', 'compiler', },
  lua = {'selene', 'luacheck',},
}
vim.api.nvim_create_autocmd({ "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
