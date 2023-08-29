-- cspell:ignore lazypath stdpath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    enabled = false,
  },
  dev = {
    path = "~/Projects/nvim-plugins",
    -----@type string[]
    --patterns = { "gualcasas", "nvim-lint" },
    fallback = true,
  },
})
