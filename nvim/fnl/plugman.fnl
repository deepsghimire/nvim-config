(fn bootstrap []
  (let [lazypath (.. (vim.fn.stdpath :data) "/lazy/lazy.nvim")]
    (when (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
      (vim.fn.system
        ["git"
         "clone"
         "--filter=blob:none"
         "https://github.com/folke/lazy.nvim.git"
         "--branch=stable"
         lazypath]))
      (vim.opt.rtp:prepend lazypath)))


(fn setup []
  (bootstrap)
  (let [lazy (require :lazy)]
    (lazy.setup "plugins" {:config {:defaults {:lazy true}}})))

{:setup setup}
