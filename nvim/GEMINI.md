# Neovim Configuration Overview

This is a modular Neovim configuration using `lazy.nvim` as the plugin manager.

## Core Architecture

- **`init.lua`**: The entry point. It requires and initializes the core modules: `options`, `keymaps`, and `plugman`.
- **`lua/options.lua`**: Contains all global Vim options (`vim.opt`) and global variables (`vim.g`).
- **`lua/keymaps.lua`**: Centralized keymap management. It defines both general mappings and LSP-specific mappings that are applied on `LspAttach`.
- **`lua/plugman.lua`**: Bootstraps `lazy.nvim` and configures it to load plugin specifications from the `lua/plugins/` directory.

## Plugin Management

Plugins are managed by `lazy.nvim`. Specifications are located in `lua/plugins/`.

- **Adding a Plugin**: Create a new `.lua` file in `lua/plugins/` (e.g., `lua/plugins/telescope.lua`) and return a table containing the plugin specification.
- **Configuration**: Prefer using the `opts` key in the plugin specification for simple configurations. For more complex setups, use the `config` function.
- **Lazy Loading**: Plugins are lazy-loaded by default (`lazy = true` in `plugman.lua`).

## Keymap Conventions

Keymaps are defined in `lua/keymaps.lua` using a custom wrapper:

- **General Mappings**: Use `M:map(mode, lhs, rhs, args)`.
- **LSP Mappings**: Use `M:lmap(mode, lhs, rhs, args)`. These are automatically bound to buffers when an LSP client attaches.
- **Leader Key**: The leader key is set to `<Space>` in `lua/options.lua`.

## Formatting and Linting

- **Formatting**: Handled by `conform.nvim` (specified in `lua/plugins/conform.lua`).
- **Linting**: Handled by `nvim-lint` (specified in `lua/plugins/nvim-lint.lua`).

## Development Workflows

### Adding a New Keymap
1. Open `lua/keymaps.lua`.
2. Add your mapping using `M:map` for general shortcuts or `M:lmap` for LSP-dependent shortcuts.
3. If it's a general mapping, it will be applied immediately on restart. If it's an LSP mapping, it will apply to any buffer with an active LSP.

### Modifying Options
1. Edit the `M.options` table in `lua/options.lua`.

### Managing Snippets
- Custom snippets are located in the `snippets/` directory (e.g., `snippets/all.lua`).
