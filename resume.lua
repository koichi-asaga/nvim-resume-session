-- 終了時に画面を保存し、:Resume で復元する
local file = vim.fn.stdpath("state") .. "/last_session.vim"

-- 終了直前に保存
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("mksession! " .. vim.fn.fnameescape(file))
  end,
})

-- :Resume で復元
vim.api.nvim_create_user_command("Resume", function()
  vim.cmd("source " .. vim.fn.fnameescape(file))
end, {})
