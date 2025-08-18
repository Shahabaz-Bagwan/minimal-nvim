# Minimal Neovim — Plugins & Startup

## Plugins included

- snacks.nvim — helper UI utilities (loaded by `lua/plugins/opencode.lua`)
- opencode.nvim — embedded AI/code assistant integration (toggle, ask, prompts)
- mini.nvim (echasnovski/mini.nvim) — collection of small Lua modules: indentscope, surround, cursorword, pairs, statusline, notify, tabline, extra, icons, files, etc.
- mini-pick — small fuzzy picker used for file/search UIs (used instead of dressing select)
- mini-completion / mini.snippets — completion + snippets support; loads friendly-snippets and local snippets
- mini-clue — shows keybinding/clue popup for leader/g/marks/registers/windows/z
- nvim-web-devicons — filetype icons for UI components
- indent-blankline.nvim — indent guides and scope helpers
- persistence.nvim — session persistence (save/restore sessions)
- nvim-treesitter — treesitter parsing + nvim-treesitter-context for code context
- render-markdown.nvim — improved inline markdown rendering (links, callouts, icons, checkboxes)
- dressing.nvim — nicer vim.ui.select and vim.ui.input (select disabled in favor of mini-pick)
- mason.nvim, mason-lspconfig.nvim, mason-tool-installer.nvim — LSP/server/tool installer and manager; ensures common tools (lua_ls, stylua, clangd, pyright, texlab, etc.)
- gitsigns.nvim — Git diff signs, hunks and current-line blame
- floating-term (custom) — floating terminal helper + lazygit integration (defined in `lua/plugins/floating-term.lua`)
- conform.nvim — formatter runner and format-on-save integration (stylua, prettier, clang-format)

Notes:
- Plugins are added via `vim.pack.add` in `lua/plugins/*`.
- LSP config files are in `lsp/` (e.g., `clangd.lua`, `jsonls.lua`, `lua_ls.lua`).

## Startup time — overview

Measured with:
```
nvim --startuptime nvim_startup.log +q
```

Summary from your run:
- Time to first UI (Primary process): ~2.63 ms
- Embedded process full startup (time until NVIM STARTED): ~85.93 ms

Main contributors (approx):
- LSP initialization (vim.lsp modules): ~11–15 ms
- nvim-treesitter setup and plugins: ~27–40 ms
- mason + related modules: ~16–17 ms
- mini plugins + render-markdown: ~8–12 ms

Overall: total startup is sub-100 ms in this run. Treesitter, LSP and mason are the largest contributors — typical for full-featured configs.
