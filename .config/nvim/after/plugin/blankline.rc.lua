local status, blankline = pcall(require, 'indent_blankline')
if (not status) then return end

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

blankline.setup {
  show_current_context = true,
  show_end_of_line = true,
}