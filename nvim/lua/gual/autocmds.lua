local Utils = require("gual.utils")

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = Utils.augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "checkhealth",
  },
  callback = function(event)
    ---@type number
    local buffer = event.buf
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buffer, silent = true })
  end,
})

-- Set filetype of .env* files to bash
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
  group = Utils.augroup("set_dotenv_filetype"),
  pattern = { ".env*" },
  command = "set filetype=sh",
})

-- set 4 space identation for web
vim.api.nvim_create_autocmd("BufReadPre", {
  group = Utils.augroup("set_web_identation"),
  pattern = {
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.cjs",
    "*.mjs",
  },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})
