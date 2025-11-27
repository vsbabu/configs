-- https://yobibyte.github.io/vim.html
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.number = true
-- vim.cmd("syntax on | colorscheme habamax | highlight Normal guifg=#ffaf00 guibg=#303446 ")
-- vim.cmd("syntax on | colorscheme habamax | highlight Normal guifg=#e5e9f0 guibg=#2e3440 ")
vim.cmd("syntax on | colorscheme habamax ")
vim.keymap.set("n", "<space>y", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end)
vim.keymap.set("n", "<space>c", function()
  vim.ui.input({}, function(c)
    if c and c ~= "" then
      vim.cmd("noswapfile vnew")
      vim.bo.buftype = "nofile"
      vim.bo.bufhidden = "wipe"
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
    end
  end)
end)
