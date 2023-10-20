-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

local exists = function(f)
  return vim.fn.has(f)==1 and true or false
end

vim.g.is_win   = (exists("win32") or exists("win64")) and true or false
vim.g.is_linux = (exists("unix") and (not exists("macunix"))) and true or false
vim.g.is_mac   = exists("macunix") and true or false
vim.g.is_wsl   = (exists("wsl") and exists("linux")) and true or false

if vim.g.is_wsl then
  -- this enables Windows to  WSL clipboard interaction. 
  -- if you don't have win32yank, swap with powershell version - that makes paste slower though
  vim.g.clipboard = {
    name = 'WslClipboard',
    cache_enabled = 0,
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      -- ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      -- ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["+"] = "/mnt/c/Users/vsbab/scoop/shims/win32yank.exe -o --lf",
      ["*"] = "/mnt/c/Users/vsbab/scoop/shims/win32yank.exe -o --lf",
    },
  }
elseif vim.g.is_win then
  vim.opt.shell = "pwsh.exe"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.cmd [[
      let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      set shellquote= shellxquote=
    ]]
  -- this enables system windows clipboard
  vim.g.clipboard = {
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
  }
end

vim.wo.wrap = false

lvim.plugins = {
  {"catppuccin/nvim", name="catppuccin"},

  { -- python starter plugins
    "ChristianChiarulli/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
  },
}
if vim.g.is_wsl then
  lvim.colorscheme = "catppuccin-frappe"
else
  lvim.colorscheme = "catppuccin-latte"
end

-- begin: python starter lvim https://github.com/LunarVim/starter.lvim/tree/python-ide

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
-- end: python starter lvim
