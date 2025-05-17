(local options (require :options))
(local keymaps (require :keymaps))
(local plugman (require :plugman))
(local main (require :main))


(options.setup)
(keymaps.setup)
(plugman.setup)
(main.configure)
